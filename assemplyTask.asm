
.MODEL small
.STACK 256

.DATA

.CODE

jmp start

; drawing a circle with color;

 mode db 18 
 x_center dw 300
 y_center dw 200
 y_value dw 0
 x_value dw 100
 decision dw 1
 colour db 1 
;=========================================
start:
 mov ah,0 
 mov al,mode 
 int 10h 
;==========================
 mov bx, xv
 sub decision, bx
 mov al,clr 
 mov ah,0ch
 
drawcircle:
 mov al,clr 
 mov ah,0ch
 
 mov cx, xv 
 add cx, xcenter 
 mov dx, yval
 add dx, ycntr
 int 10h
 
 mov cx, xv 
 neg cx
 add cx, ycntr 
 int 10h
 
 mov cx, yval 
 add cx, xcenter 
 mov dx, xv
 add dx, ycntr
 int 10h
 
 mov cx, yval
 neg cx
 add cx, xcenter 
 int 10h
 
 mov cx, xv 
 add cx, xcenter 
 mov dx, yval
 neg dx
 add dx, ycntr
 int 10h
 
 mov cx, xv 
 neg cx
 add cx, xcenter 
 int 10h

 mov cx, yval 
 add cx, xcenter 
 mov dx, xv
 neg dx
 add dx, ycntr
 int 10h
 
 mov cx, yval 
 neg cx
 add cx, xcenter 
 int 10h
 
 inc yval

condition1:
 cmp decision,0
 ja condition2
 mov cx, y_value
 mov ax, 2
 imul cx
 add cx, 1
 inc cx
 add decision, cx
 mov bx, yval
 mov dx, xval
 cmp bx, dx
 ja readkey
 jmp drawcircle

condition2:
 dec x_value
 mov cx, yval
 sub cx, xv
 mov ax, 2
 imul cx
 inc cx
 add decision, cx
 mov bx, yval
 mov dx, xv
 cmp bx, dx
 ja readkey
 jmp drawcircle


 

readkey:
 mov ah,0
 int 16h 

endd:
 mov ah,0 
 mov al,03 
 int 10h 
 mov ah,04ch
 mov al,0
 int 21h 

END Start
       
       