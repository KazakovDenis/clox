#include "common.h"
#include "chunk.h"
#include "debug.h"

int main(int argc, const char** argv) {
	if (argc > 2)
		// too many args
		return 1;

  Chunk chunk;
  initChunk(&chunk);
  writeChunk(&chunk, OP_RETURN);
	disassembleChunk(&chunk, "test chunk");
  freeChunk(&chunk);

	return 0;
}
