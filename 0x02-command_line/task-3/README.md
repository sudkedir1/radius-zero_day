1,The purpose of find.

find searches for files based on their metadata (like name, size, or date)

The purpose of grep

grep searches inside files for specific text or patterns.

2,README.md  practice  task-1  task-2  task-3  task-4

3,Finding a Filename (Metadata Search)
When you search for a filename (using tools like find or locate), the operating system looks at the directory index—the table of contents that tracks where files live, what they are named, how big they are, and when they were last modified.

--When you search inside a file (using tools like grep), the program actually opens the file and reads its contents line by line, comparing the text against your search word or pattern.

4,Combining find and grep allows you to narrow down which files get searched before scanning their contents. This makes your search faster and avoids clutter from irrelevant file types (like binary files, logs, or backups).