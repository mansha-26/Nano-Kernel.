#ifndef FS_H
#define FS_H

#define MAX_FILES 32
#define MAX_FILENAME_LEN 32

typedef struct {
    char name[MAX_FILENAME_LEN];
    int size;
    int type;
} file_t;

void fs_init(void);
void show_files(void);

#endif
