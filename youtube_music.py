#!/usr/bin/env python3
import os
import subprocess
import argparse
from pathlib import Path


def setup_dependencies():
    """Install required dependencies if not present"""
    try:
        import yt_dlp
    except ImportError:
        print("Installing yt-dlp...")
        subprocess.run(["pip", "install", "yt-dlp"])


def check_player():
    """Check if mpv is installed"""
    if subprocess.run(["which", "mpv"], capture_output=True).returncode != 0:
        print("mpv is not installed. Please install it using your package manager.")
        print("For example: sudo apt install mpv")
        return False
    return True


def download_and_play(url, music_dir):
    """Download and play YouTube music"""
    music_path = Path(music_dir).expanduser()
    music_path.mkdir(parents=True, exist_ok=True)

    ydl_opts = {
        "format": "bestaudio/best",
        "postprocessors": [
            {
                "key": "FFmpegExtractAudio",
                "preferredcodec": "mp3",
                "preferredquality": "192",
            }
        ],
        "outtmpl": str(music_path / "%(title)s.%(ext)s"),
        "quiet": False,
        "no_warnings": True,
    }

    try:
        import yt_dlp

        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            info = ydl.extract_info(url, download=True)
            title = info["title"]
            filename = f"{title}.mp3"
            file_path = music_path / filename

            print(f"\nPlaying: {title}")
            subprocess.run(["mpv", str(file_path)])

    except Exception as e:
        print(f"Error: {str(e)}")


def main():
    parser = argparse.ArgumentParser(
        description="Download and play YouTube music from CLI"
    )
    parser.add_argument("url", help="YouTube URL of the song")
    parser.add_argument(
        "--dir", default="~/Music", help="Directory to store music (default: ~/Music)"
    )

    args = parser.parse_args()

    setup_dependencies()
    if check_player():
        download_and_play(args.url, args.dir)


if __name__ == "__main__":
    main()
