# VGA-Framebuffer
FB project for ChipExpo(and my Diploma Project)
## Features
- Fixed memory codec's glitch, which is supposed to be responsible for white tracks in a monitor.
- Enhanced memory size up to full-scale RGB.
- Implemented the ping-pong mode in memory read/write behavior.(read during active screen area, write during blank area)
- Fixed FIFO.
## Problems
- Cursor-brush hasnt changed yet.
## Bottlenecks
- Due to memory size and configuration, write operation has 5 clocks latency, while read has 1 clk latency.
- GRAM resolution is stil 80x60. Its good for a start, but bothers me sometimes anyway.
