/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: xmatute- <xmatute-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/03 15:09:59 by xmatute-          #+#    #+#             */
/*   Updated: 2025/01/29 17:08:31 by xmatute-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

int strlen_test(char *str)
{
    printf("str: %s\n", str);
    printf("strlen: %zu\n", strlen(str));
    printf("ft_strlen: %zu\n", ft_strlen(str));
    if (ft_strlen(str) == strlen(str))
    {
        printf("ft_strlen: OK\n");
        return (1);
    }
    else
    {
        printf("ft_strlen: KO\n");
        return (0);
    }
}

int strcpy_test(char *str)
{
    char *cpy = malloc(strlen(str) + 1);
    char *ft_cpy = malloc(strlen(str) + 1);

    printf("str: %s\n", str);
    printf("strcpy: %s\n", strcpy(cpy, str));
    printf("ft_strcpy: %s\n", ft_strcpy(ft_cpy, str));
    printf("ft_strcpy: %s\n", ft_cpy);
    if (strcmp(cpy, ft_cpy) == 0)
    {
        printf("ft_strcpy: OK\n");
        free(cpy);
        free(ft_cpy);
        return (1);
    }
    else
    {
        printf("ft_strcpy: KO\n");
        free(cpy);
        free(ft_cpy);
        return (0);
    }
}

int strcmp_test(char *s1, char *s2)
{
    printf("s1: %s\n", s1);
    printf("s2: %s\n", s2);
    printf("strcmp: %d\n", strcmp(s1, s2));
    printf("ft_strcmp: %d\n", ft_strcmp(s1, s2));
    if (ft_strcmp(s1, s2) == strcmp(s1, s2))
    {
        printf("ft_strcmp: OK\n");
        return (1);
    }
    else
    {
        printf("ft_strcmp: KO\n");
        return (0);
    }
}

int write_test(int fd, char *str, size_t count)
{
    printf("str: %s\n", str);
    printf("write: %zd\n", write(fd, str, count));
    printf("ft_write: %zd\n", ft_write(fd, str, count));
    if (ft_write(fd, str, count) == write(fd, str, count))
    {
        printf("ft_write: OK\n");
        return (1);
    }
    else
    {
        printf("ft_write: KO\n");
        return (0);
    }
}

int read_test(char * file, size_t n)
{
    char *buf = malloc(n + 1);
    char *ft_buf = malloc(n + 1);
    int fd = open(file, O_RDONLY);
    int ft_fd = open(file, O_RDONLY);

    printf("file: %s\n", file);
    printf("read: %zd\n", read(fd, buf, n));
    printf("buf: %s\n", buf);
    printf("ft_read: %zd\n", ft_read(ft_fd, ft_buf, n));
    printf("ft_buf: %s\n", ft_buf);

    if (strcmp(buf, ft_buf) == 0)
    {
        printf("ft_read: OK\n");
        free(buf);
        free(ft_buf);
        return (1);
    }
    else
    {
        printf("ft_read: KO\n");
        free(buf);
        free(ft_buf);
        return (0);
    }
}

int strdup_test(char *str)
{
    char *cpy = strdup(str);
    char *ft_cpy = ft_strdup(str);

    printf("str: %s\n", str);
    printf("strdup: %s\n", cpy);
    printf("ft_strdup: %s\n", ft_cpy);
    if (strcmp(cpy, ft_cpy) == 0)
    {
        printf("ft_strdup: OK\n");
        free(cpy);
        free(ft_cpy);
        return (1);
    }
    else
    {
        printf("ft_strdup: KO\n");
        free(cpy);
        free(ft_cpy);
        return (0);
    }
}

int main()
{
    char *str = strdup("Agur Pallete!");

    strlen_test(str);
    strcpy_test(str);
    strcmp_test(str, str);
    strcmp_test(str, "Hola Manolo!");
    write_test(1, str, strlen(str));
    strdup_test(str);
    
    printf("\n");
    free(str);
    
    char *empty_str = strdup("");

    strlen_test(empty_str);
    strcpy_test(empty_str);
    strcmp_test(empty_str, empty_str);
    write_test(1, empty_str, strlen(empty_str));
    strdup_test(empty_str);

    free(empty_str);

    char *file = strdup("main.c");
    read_test(file, 100);
    free(file);
    
    return (0);
}