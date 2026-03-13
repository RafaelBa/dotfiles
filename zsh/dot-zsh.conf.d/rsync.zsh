# recursive, copy symlinks as symlinks, preserve modification times, preserve device files, Partial and Progress
alias rsync-smb="rsync -rltDP"

# show files that are different or missing - missing files in `src` will not be shown, use rsync-diff for this instead
alias rsync-check="rsync -r --dry-run --itemize-changes"

# like rsync-check, but with --delete to see missing files on both sides
alias rsync-diff="rsync -r --dry-run --itemize-changes --delete"

# rsync uses modification date and file size to determine whether a file is "different" - using checksum checks if the actual content is different - this is slower and needs to run a checksum logic on all files on source and destination
for cmd in check diff; do
	alias rsync-$cmd-checksum="rsync-$cmd --checksum"
done

