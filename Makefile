NAME = libutils.a

#########
RM = rm -rf
AR = ar -rcs
CC = cc
CFLAGS = -Wall -Wextra -Werror -O3 #-march=native -flto -funroll-loops -fomit-frame-pointer \
         -falign-functions=16 -fno-strict-aliasing -ftree-vectorize
LDFLAGS = -lm -lpthread
RELEASE_CFLAGS = $(CFLAGS) -DNDEBUG
#########

#########
FILES = ft_malloc ft_list memcpy strcmp strlen ht memset

SRC = $(addsuffix .c, $(FILES))

vpath %.c srcs
#########

#########
OBJ_DIR = objs
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))
DEP = $(addsuffix .d, $(basename $(OBJ)))
#########

#########
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) -MMD $(CFLAGS) -Iinc -Isrcs -c $< -o $@
#########

all: .gitignore $(NAME)

$(NAME): $(OBJ)
	@$(AR) $(NAME) $(OBJ)
	@echo "Static library $(NAME) created."

release: CFLAGS = $(RELEASE_CFLAGS)
release: re
	@echo "Release build complete."

clean:
	$(RM) $(OBJ) $(DEP)
	$(RM) -r $(OBJ_DIR)
	@echo "Objects and dependencies removed."

fclean: clean
	$(RM) $(NAME)
	@echo "Library removed."

re: fclean all

.gitignore:
	@if [ ! -f .gitignore ]; then \
		echo ".gitignore not found, creating it..."; \
		echo ".gitignore" >> .gitignore; \
		echo "$(NAME)" >> .gitignore; \
		echo "$(OBJ_DIR)/" >> .gitignore; \
		echo ".gitignore created and updated with entries."; \
	else \
		echo ".gitignore already exists."; \
	fi

.PHONY: all clean fclean re release .gitignore

-include $(DEP)
