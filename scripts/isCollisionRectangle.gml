/*
Returns whether there is a collision with two rectangles.
Note that the rectangles cannot have a negative width or height.
0: x1 (of the first rectangle)
1: y1
2: x2
3: y2
4: x1 (of the second rectangle)
5: y1
6: x2
7: y2
return  whether there was a collision
*/
w1=argument2-argument0
h1=argument3-argument1
w2=argument6-argument4
h2=argument7-argument5
if(w2<=0 or h2<=0 or w1<=0 or h1<=0)
  return 0
w2+=argument4
h2+=argument5
w1+=argument0
h1+=argument1
return (w2<argument4 or w2>argument0) and (h2<argument5 or h2>argument1) and (w1<argument0 or w1>argument4) and (h1<argument1 or h1>argument5)
