import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.Instant;
import java.util.concurrent.TimeUnit;
import java.util.stream.Stream;

class WatchAndExecute {
	private static Instant lastChange = null;
	public static void main(String[] args) {
		String usage = "Usage: java WatchAndExecute <FILE>";
		if (args.length == 0) {
			throw new IllegalArgumentException("No file given.\n" + usage);
		}
		if (args[0] != null && Stream.of("-h", "--help", "-help").anyMatch(e -> e.equalsIgnoreCase(args[0]))) {
			System.out.println(usage);
			System.exit(0);
		}
		try {
			final Path p2File = Paths.get(args[0]);
			if (!Files.exists(p2File)) {
				throw new IllegalArgumentException("File " + p2File + " does not exist.\n" + usage);
			}
			runLoop(p2File);
		} catch (InvalidPathException e) {
			throw new IllegalArgumentException("The given file path "+ args[0] +" ist invalid.\n" + usage);
		}
	}
	
	private static void runLoop(Path p2File) {
		System.setProperty("user.dir", p2File.toAbsolutePath().getParent().toAbsolutePath().toString());
		try {
			WatchAndExecute.lastChange = getLastChange(p2File);
			while (true) {
				try {
					TimeUnit.SECONDS.sleep(2);
					final Instant currLastChange = getLastChange(p2File);
					if (currLastChange.isAfter(WatchAndExecute.lastChange)) {
						execJob();
						WatchAndExecute.lastChange = currLastChange;
					}
				} catch (InterruptedException e) {
					throw new IllegalStateException("Current thread not active");
				}
			}
		} catch (IOException e) {
			throw new IllegalStateException(e);
		}
	}
	
	private static Instant getLastChange(Path p2File) throws IOException {
		return Files.getLastModifiedTime(p2File).toInstant();
	}
	
	private static void execJob() {
		try {
			final Process process = Runtime.getRuntime().exec("make");
			process.getErrorStream().transferTo(System.err);
			process.getInputStream().transferTo(System.out);
			process.waitFor(20, TimeUnit.SECONDS);
			final int exitValue = process.exitValue();
			if (exitValue != 0) {
				System.err.println("Error occured while executing make!");
			}
		} catch (IOException | InterruptedException e) {
			throw new IllegalStateException("Caught severe error while trying to execute make.", e);
		}
	}
	
}
