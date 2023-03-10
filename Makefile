SRC_DIR  = ./src
OBJ_DIR  = ./obj

SRC	     = $(wildcard $(SRC_DIR)/*.c)
OBJS	 = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

OUT      = clox
CC	     = gcc
SANS     = address,undefined,leak,pointer-subtract
FLAGS	 = -g -std=gnu17 -Wall -Wextra -Werror -fsanitize=$(SANS) -I./include


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) -c $< $(FLAGS) -o $@

$(OUT): $(OBJS)
	$(CC) $(OBJS) $(FLAGS) -o $@

run: $(OUT)
	@./$<

clean:
	rm -f $(OBJ_DIR)/*.o $(OUT)
