// Server side C/C++ program to demonstrate Socket programming
#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080

int main(int argc, char const *argv[])
{
    int server_fd, new_socket, valread;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    char buffer[1024] = {0};
    char *hello = "Server receiving command";

    printf("start\n");

    // Creating socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0)
    {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    printf("socket seccess\n");

    // Forcefully attaching socket to the port 8080
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)))
    {
        perror("setsockopt");
        exit(EXIT_FAILURE);
    }
    printf("socket to ip 0.0.0.0 port 8080\n");

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr("0.0.0.0"); //INADDR_ANY;
    address.sin_port = htons(PORT);

    // Forcefully attaching socket to the port 8080
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0)
    {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    printf("bind\n");

    if (listen(server_fd, 3) < 0)
    {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    printf("listen socket\n");

    if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t *)&addrlen)) < 0)
    {
        perror("accept");
        exit(EXIT_FAILURE);
    }
    printf("accept new socket\n");


    while(1){
        valread = read(new_socket, buffer, 1024);
        char arrc[1] = {0};                   //初始化char[]类型，并赋值为空
        char arrc2[1] = "1";

        strncpy(arrc,buffer,1);              //const char*类型转char[]类型

        // for(int i=0;i<1;++i){
        //     printf("%d \n",arrc[i]);
        //     printf("%d \n",arrc2[i]);
        // }
               
    if(arrc[0]==arrc2[0]){
        printf("%s Switch on received\n", buffer);
        printf("LED ON\n");
    }else{
        printf("%s Switch off received\n", buffer);
        printf("LED OFF\n");
    }

    }

    send(new_socket, hello, strlen(hello), 0);

    
    
    return 0;
}
