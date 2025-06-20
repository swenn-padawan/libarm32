#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

void	_exit(int status) {
	while (1);
}

int		_write(int file, char *ptr, int len){
	return (len);
}

caddr_t	_sbrk(int incr){
	extern char	end;
	static char	*heap_end;
	char		*prev_heap_end;

	if (heap_end == 0)
		heap_end = &end;
	prev_heap_end = heap_end;
	heap_end += incr;
	return (caddr_t)prev_heap_end;
}
