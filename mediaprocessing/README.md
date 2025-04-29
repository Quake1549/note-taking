

🎬 YouTube Clip Extractor

Easily download any YouTube video and extract a specific time frame into a clean, lightweight MP4 clip — all from your terminal! 🚀

⸻

✨ Features
	•	🔥 Download videos directly from YouTube.
	•	✂️ Select any start and end time to trim.
	•	⚡ Super-fast cutting without re-encoding.
	•	🧹 Auto-cleans temporary files.
	•	🎯 Output always saved as MP4.

⸻

🛠 Requirements

Make sure you have the following installed:
	•	yt-dlp
	•	ffmpeg

Install them easily on macOS (Homebrew):

```bash
brew install yt-dlp ffmpeg
```


⸻

📥 Installation
	1.	Save the script to a file called yt-to-clip.sh.
	2.	Give it execute permissions:

chmod +x yt-to-clip.sh



⸻

🚀 Usage

Run the script:

./yt-to-clip.sh

Then:
	1.	Paste the YouTube URL when prompted.
	2.	Enter the start and end times in HH:MM:SS format.
	3.	Your trimmed clip will be saved as output.mp4!

⸻

📸 Example

$ ./yt-to-clip.sh
Enter the YouTube video URL: https://www.youtube.com/watch?v=dQw4w9WgXcQ
Downloading video...
Enter start time (HH:MM:SS): 00:01:00
Enter end time (HH:MM:SS): 00:01:15
Extracting the requested clip...
Trimmed video saved as output.mp4



⸻

⚡ How It Works
	•	Downloads the best MP4 version available.
	•	Asks for the clip range.
	•	Cuts the requested section without re-encoding for fast results.
	•	Deletes the full original video after trimming to keep things clean.

⸻

⚠️ Notes
	•	Start and end times must be within the video’s duration.
	•	If a video is not available in MP4 format, yt-dlp will automatically merge streams and convert if needed.
	
