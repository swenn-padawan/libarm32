#-------------------------------------------------------------------------------#
#																			    #
#								   	libarm32								    #
#																			    #
#-------------------------------------------------------------------------------#

PREFIX		:= libarm32

LIBNAME		:= $(PREFIX).a

AS			:= arm-none-eabi-as

LD			:= arm-none-eabi-ld

OBJDUMP		:= arm-none-eabi-objdump

OBJS_DIR	:= build

SRCS_DIR	:= srcs

SRCS		:= $(PREFIX)_strlen.s \

SYS_SRCS	:= syscalls.c \
SYS_OBJS	:= $(SYS_SRCS:.c=.o)

SRCS		:= $(addprefix $(SRCS_DIR)/, $(SRCS))

OBJS		:= $(addprefix $(OBJS_DIR)/, $(SRCS:%.s=%.o))

DIR_UP		=	mkdir -p $(@D)

RM			:=	rm -rf

#-------------------------------------------------------------------------------#

all: $(LIBNAME)

$(LIBNAME): $(OBJS) $(SYS_OBJS)
	@ar rc $(LIBNAME) $^
	@printf " $(GREEN)$(BOLD)$(ITALIC)■$(RESET)  building	$(GREEN)$(BOLD)$(ITALIC)$(LIBNAME)$(RESET)\n"

$(OBJS_DIR)/%.o: %.s
	@$(DIR_UP)
	@$(AS) $^ -o $@
	@printf " $(CYAN)$(BOLD)$(ITALIC)■$(RESET)  compiling	$(GRAY)$(BOLD)$(ITALIC)$<$(RESET)\n"

%.o: %.c
	@arm-none-eabi-gcc -c $< -o $@ -ffreestanding

clean:
	@$(RM) $(OBJS_DIR)
	@printf " $(RED)$(BOLD)$(ITALIC)■$(RESET)  cleaned	$(RED)$(BOLD)$(ITALIC)$(OBJS_DIR)$(RESET)\n"

fclean: clean
	@$(RM) $(LIBNAME)
	@printf " $(RED)$(BOLD)$(ITALIC)■$(RESET)  cleaned	$(RED)$(BOLD)$(ITALIC)$(LIBNAME)$(RESET)\n"

re: fclean all

#-------------------------------------------------------------------------------#

BLACK		=	\033[30m
RED			=	\033[31m
GREEN		=	\033[32m
YELLOW		=	\033[33m
BLUE		=	\033[34m
MAGENTA		=	\033[35m
CYAN		=	\033[36m
WHITE		=	\033[37m
GRAY		=	\033[90m

BOLD		=	\033[1m
ITALIC		=	\033[3m

RESET		=	\033[0m
LINE_CLR	=	\33[2K\r

