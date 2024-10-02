#  Fall 2022
#  Team Members:    
#  % Effort    :   
#
# ECE369A,  
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column


# test 1 For the 64X64 frame and a 4X4 window size
# 
#Answer 27, 34 
asize1: .word    64,   64,   4,   4    #i,   j,   k,   l
frame1: .word 255,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  
	.word 240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  250,  
	.word 242,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  236,  249,  
	.word 243,  234,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  230,  235,  248,  
	.word 244,  235,  234,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  232,  229,  234,  247,  
	.word 245,  236,  235,  242,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  242,  231,  228,  233,  246,  
	.word 246,  237,  236,  243,  228,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  227,  230,  241,  230,  227,  232,  245,  
	.word 247,  238,  237,  244,  229,  252,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  226,  229,  240,  229,  226,  231,  244,  
	.word 248,  239,  238,  245,  230,  253,  254,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  230,  225,  228,  239,  228,  225,  230,  243,  
	.word 249,  240,  239,  246,  231,  254,  225,  234,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  
	.word 250,  241,  240,  247,  232,  225,  226,  235,  252,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  
	.word 251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  
	.word 252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  
	.word 253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  
	.word 254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  
	.word 225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  
	.word 226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  
	.word 227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  236,  249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  
	.word 228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  234,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  230,  235,  248,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  
	.word 229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  244,  235,  234,  240,  101,  101,  101,  101,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  232,  229,  234,  247,  238,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  
	.word 230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  232,  245,  236,  235,  242,  101,  101,  101,  101,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  242,  231,  228,  233,  246,  237,  236,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  
	.word 231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  228,  233,  246,  237,  236,  243,  101,  101,  101,  101,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  227,  230,  241,  230,  227,  232,  245,  236,  235,  242,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  
	.word 232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  232,  229,  234,  247,  238,  237,  244,  101,  101,  101,  101,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  226,  229,  240,  229,  226,  231,  244,  235,  234,  241,  226,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  
	.word 233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  244,  233,  230,  235,  248,  239,  238,  245,  230,  253,  254,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  230,  225,  228,  239,  228,  225,  230,  243,  234,  233,  240,  225,  248,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  
	.word 234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  234,  245,  234,  231,  236,  249,  240,  239,  246,  231,  254,  225,  234,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  233,  232,  239,  254,  247,  248,  227,  244,  239,  242,  253,  242,  239,  244,  227,  
	.word 235,  226,  225,  232,  247,  240,  241,  250,  237,  232,  235,  246,  235,  232,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  232,  231,  238,  253,  246,  247,  226,  243,  238,  241,  252,  241,  238,  243,  226,  
	.word 236,  227,  226,  233,  248,  241,  242,  251,  238,  233,  236,  247,  236,  233,  238,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  231,  230,  237,  252,  245,  246,  225,  242,  237,  240,  251,  240,  237,  242,  225,  
	.word 237,  228,  227,  234,  249,  242,  243,  252,  239,  234,  237,  248,  237,  234,  239,  252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  232,  231,  230,  229,  228,  227,  226,  225,  100,  100,  100,  100,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  230,  229,  236,  251,  244,  245,  254,  241,  236,  239,  250,  239,  236,  241,  254,  
	.word 238,  229,  228,  235,  250,  243,  244,  253,  240,  235,  238,  249,  238,  235,  240,  253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  252,  251,  250,  249,  248,  247,  246,  100,  99,  100,  100,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  229,  228,  235,  250,  243,  244,  253,  240,  235,  238,  249,  238,  235,  240,  253,  
	.word 239,  230,  229,  236,  251,  244,  245,  254,  241,  236,  239,  250,  239,  236,  241,  254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  250,  249,  248,  120,  120,  245,  100,  100,  99,  100,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  228,  227,  234,  249,  242,  243,  252,  239,  234,  237,  248,  237,  234,  239,  252,  
	.word 240,  231,  230,  237,  252,  245,  246,  225,  242,  237,  240,  251,  240,  237,  242,  225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  226,  225,  120,  120,  120,  100,  100,  100,  100,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  227,  226,  233,  248,  241,  242,  251,  238,  233,  236,  247,  236,  233,  238,  251,  
	.word 241,  232,  231,  238,  253,  246,  247,  226,  243,  238,  241,  252,  241,  238,  243,  226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  240,  239,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  226,  225,  232,  247,  240,  241,  250,  237,  232,  235,  246,  235,  232,  237,  250,  
	.word 242,  233,  232,  239,  254,  247,  248,  227,  244,  239,  242,  253,  242,  239,  244,  227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  101,  120,  120,  120,  120,  120,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  234,  245,  234,  231,  236,  249,  
	.word 243,  234,  233,  240,  225,  248,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  120,  120,  120,  120,  120,  120,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  244,  233,  230,  235,  248,  
	.word 244,  235,  234,  241,  226,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  120,  120,  120,  120,  120,  120,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  232,  229,  234,  247,  
	.word 245,  236,  235,  242,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  229,  120,  120,  120,  120,  120,  120,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  228,  233,  246,  
	.word 246,  237,  236,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  233,  234,  120,  120,  120,  120,  120,  120,  241,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  232,  245,  
	.word 247,  238,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  245,  246,  247,  120,  120,  120,  101,  252,  253,  254,  225,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  244,  
	.word 248,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  
	.word 249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  227,  244,  239,  242,  253,  242,  239,  244,  227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  
	.word 250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  226,  225,  232,  247,  240,  241,  250,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  243,  238,  241,  252,  241,  238,  243,  226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  
	.word 251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  227,  226,  233,  248,  241,  242,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  237,  240,  251,  240,  237,  242,  225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  
	.word 252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  228,  227,  234,  249,  242,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  239,  250,  239,  236,  241,  254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  
	.word 253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  229,  228,  235,  250,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  249,  238,  235,  240,  253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  
	.word 254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  230,  229,  236,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  237,  234,  239,  252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  
	.word 225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  231,  230,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  233,  238,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  
	.word 226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  232,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  
	.word 227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  
	.word 228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  
	.word 229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  
	.word 230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  243,  102,  102,  102,  102,  248,  243,  246,  227,  246,  243,  248,  231,  
	.word 231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  102,  102,  102,  102,  247,  242,  245,  226,  245,  242,  247,  230,  
	.word 232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  102,  102,  102,  102,  246,  241,  244,  225,  244,  241,  246,  229,  
	.word 233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  102,  102,  102,  102,  245,  240,  243,  254,  243,  240,  245,  228,  
	.word 234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  227,  244,  239,  242,  253,  242,  239,  244,  227,  
	.word 235,  226,  225,  232,  247,  240,  241,  250,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  243,  238,  241,  252,  241,  238,  243,  226,  
	.word 236,  227,  226,  233,  248,  241,  242,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  237,  240,  251,  240,  237,  242,  225,  
	.word 237,  228,  227,  234,  249,  242,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  239,  250,  239,  236,  241,  254,  
	.word 238,  229,  228,  235,  250,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  249,  238,  235,  240,  253,  
	.word 239,  230,  229,  236,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  237,  234,  239,  252,  
	.word 240,  231,  230,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  233,  238,  251,  
	.word 241,  232,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  237,  250,  
	.word 242,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  249,  
	.word 243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247
                  
window1: .word    99,  99,  99,  99,   
          .word    99,  99,  99,  99,   
          .word    99,  99,  99,  99,   
           .word   99,  99,  99,  99
			




         
newline: .asciiz     "\n" 


########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main:  
    #addi    $sp, $sp, -4    # Make space on stack
    #sw      $ra, 0($sp)     # Save return address
         
    # Start test 1 
    ############################################################
    la      $a0, asize1     # 1st parameter: address of asize1[0] #PC 0
    la      $a1, frame1     # 2nd parameter: address of frame1[0] #PC 4
    la      $a2, window1    # 3rd parameter: address of window1[0] #PC 8
   
    jal     vbsme           # call function                        #PC 12
    # jal     print_result    # print results to console
    
    ############################################################
    # End of test 1   
                    
    #lw      $ra, 0($sp)         # Restore return address
    #addi    $sp, $sp, 4         # Restore stack pointer
    j       end_program                 # Return           #PC 16

end_program:                    # remain in infinite loop
	j end_program                                           #PC 20
################### Print Result ####################################
# print_result:
#    #  Printing $v0
#    add     $a0, $v0, $zero     # Load $v0 for printing
#    li      $v0, 1              # Load the system call numbers
#    syscall
   
#    #  Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    #  Printing $v1
#    add     $a0, $v1, $zero      # Load $v1 for printing
#    li      $v0, 1                # Load the system call numbers
#    syscall

#    #  Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    #  Print newline.
#    la      $a0, newline          # Load value for printing
#    li      $v0, 4                # Load the system call numbers
#    syscall
   
#    jr      $ra                   #function return

#####################################################################
### vbsme
#####################################################################

#.text
.globl  vbsme

#Linear search algorithm

# Begin subroutine
#$t0 -> 
#$t1 ->
#$t2 ->
#$t3 ->
#$t4 ->
#$t5 -> Stores x for SAD
#$t6 -> Stores Y for sad
#$t7 ->
#$t8 -> Stores overall width of frame Fx
#$t9 -> Stores overall height of frame Fy
#s0 -> stores the 'new' grid size Fx 
#s1 -> stores the 'new' grid size Fy
#s2 -> current x coordinate
#s3 -> current y coordinate
#s4 -> STORES Current Minimum SAD
#s5 ->
#s6 ->
#s7 -> stores return address
#FIXME: 67 
vbsme:  
    lw $t6, 12($a0) #This gets the x value of the window (columns)      #PC 24
	lw $t7, 8($a0) #This gets the y value of the window (rows)	        #PC 28
	lw $t8, 4($a0) #This stores the x value of the frame (columns)      #PC 32
    lw $t9, 0($a0) #This stores the y vaue of the frame (rows)          #PC 36
    addi $t7, $t7, -1 #This subtracts 1 from the windows y value        #PC 40
    addi $t6, $t6, -1 #This subtracts 1 from the windows x value        #PC 44
    addi $s7, $ra, 0 #This stores the return address                    #PC 48
    sub $s1, $t9, $t7 #This stores Fy - (Wy - 1)                        #PC 52
    addi $s4, $zero, 10000 #This initializes the SAD value to a very big number  #PC 56
    sub $s0, $t8, $t6 #This stores Fx - (Wx - 1)                                 #PC 60
    #We hae our overall grid size now

FORLOOPY: 
    #slt $t0, $s3, $s1 #Check to see if our current Y coord is less than our Fy  #PC 64
    addiu $s3, $s1, EXIT #If it is not, then we are done                        #PC 68

FORLOOPX:
    #slt $t0, $s2, $s0 #Check to see if our current X coord is less than our Fx  #PC 72
    #beq $t0, $zero, EXITLOOPX #If it is not, then we need to go back to the outer loop  #PC 76
    addiu $s2, $s0, EXITLOOPX 
    jal STARTOFSAD #This starts the SAD algorithm                                       #PC 80
    addi $s2, $s2, 1 #This increments the x coordinate by 1                             #PC 84
    j FORLOOPX #This jumps back to the beginning of the inner loop                      #PC 88

EXITLOOPX:
    addi $s3, $s3, 1 #This increments the y coordinate by 1                             #PC 96
    addi $s2, $zero, 0 #This initializes the x coordinate to 0                          #PC 92 
    j FORLOOPY #This jumps back to the beginning of the outer loop                      #PC 100 

EXIT:
    jr $s7                                                                              #PC 104


STARTOFSAD:
    lw $t7, 8($a0) #This gets the y value of the window (rows)                          #PC 108
    add $t6, $zero, $s3 #This stores the current y coordinate                           #PC 112
    add $t8, $zero, $zero #This is our SAD values that we are going to calculate. This is initialized to 0 each time the SAD function is called  #PC 116
    add $t3, $t6, $t7 #This creates our for loop end condition of y-initial + window Y-value        #PC 120

SADYLOOP:
    #slt $t0, $t6, $t3 #This assigns $t0 with 1 if $t6 < y-initial + window Y-value              #PC 124
    #beq $t0, $zero, EXITSADYLOOP #If $t0 is 0, then we are done with the y loop
    addiu $t6, $t3, EXITSADYLOOP        
    lw $t7, 12($a0) #This gets the x value of the window (columns)                              #PC 132
    add $t5, $zero, $s2 #This stores the current x coordinate                                   #PC 136
    add $t4, $t5, $t7 #This creates our for loop end condition of x-initial + window X-value    #PC 140

SADXLOOP:
    addiu $t5, $t4, EXITSADXLOOP
    #slt $t0, $t5, $t4 #This assigns $t0 with 1 if $t5 < x-initial + window X-value              #PC 144
    lw $t7, 4($a0) #This gets the x value of the frame (columns)                                #PC 148
    #beq $t0, $zero, EXITSADXLOOP #If $t0 is 0, then we are done with the x loop                 #PC 152
    mul $t1, $t6, $t7 #This multiplies the current y coordinate by the frame x value            #PC 156
    add $t1, $t1, $t5 #This adds the current x coordinate to the previous result                #PC 160
    sll $t1, $t1, 2 #This multiplies the previous result by 4 to get the correct offset         #PC 164
    add $t1, $t1, $a1 #This adds the offset to the address of the frame                         #PC 168
    lw $s5, 0($t1) #This loads the value of the frame into $s5                                  #PC 172
    #This calculates the address of our index for the frame 
    lw $t7, 12($a0) #This gets the x value of the window (columns)                              #PC 176
    sub $s6, $t6, $s3 #This calculates the offset for the window                                #PC 180
    sub $t0, $t5, $s2 #This calculates the offset for the window                                #PC 184
    mul $t1, $s6, $t7 #This multiplies the offset by the window x value                         #PC 188         
    add $t1, $t1, $t0 #This adds the offset to the previous result                              #PC 192
    sll $t1, $t1, 2 #This multiplies the previous result by 4 to get the correct offset         #PC 196
    add $s6, $t1, $a2 #This adds the offset to the address of the window                        #PC 200
    lw $s6, 0($s6) #This loads the value of the window into $s6                                 #PC 204
    #This calculates the address of our index for the window                                    
    sub $t1, $s6, $s5 #This computes the value of window[y * Wx + x] - frame[y * fx + x] and reassigns $t4 with that value      #PC 208
    slt $t0, $t1, $zero #This checks to see if the value is negative                                                            #PC 212
    bne $t0, $zero, ABSVALUE #If it is, then we need to take the absolute value                                                 #PC 216
    addiu $zero, $t1, ABSVALUE #FIXME:
    add $t8, $t8, $t1 #This adds the value to the SAD value                                                                     #PC 220
    addi $t5, $t5, 1 #This increments the x coordinate by 1                                                                     #PC 224
    j SADXLOOP #This jumps back to the beginning of the x loop                                                                  #PC 228
 
ABSVALUE:
    addi $t0, $zero, -1 #This initializes $t0 to -1                                                                             #PC 232
    mul $t1, $t1, $t0 #This multiplies the value by -1 to get the absolute value                                                #PC 236
    add $t8, $t8, $t1 #This adds the value to the SAD value                                                                     #PC 240
    addi $t5, $t5, 1 #This increments the x coordinate by 1                                                                     #PC 244
    j SADXLOOP #This jumps back to the beginning of the x loop                                                                  #PC 248

EXITSADXLOOP:
    addi $t6, $t6, 1 #This increments the y coordinate by 1                                                                     #PC 252
    j SADYLOOP #This jumps back to the beginning of the y loop                                                                  #PC 256

EXITSADYLOOP:
    beq $t8, $s4, STORESAD #If the SAD value is equal to the current minimum SAD value, then we need to store the new minimum SAD value     #PC 260
    #slt $t0, $t8, $s4 #This assigns $t0 with 1 if $t2 < current minimum SAD value                                                           #PC 264
    #beq $t0, $zero, EXITSAD #If $t0 is 0, then we are done with the SAD function 
    addiu $t8, $s4, EXITSAD                                                           #PC 268

STORESAD:
    add $s4, $t8, $zero #This stores the new minimum SAD value                                                                              #PC 272
    add $v0, $zero, $s3 #If we found a new sad value store the y coordinate (row)                                                           #PC 276
    add $v1, $zero, $s2 #If we found a new sad value store the x coordinate (column)                                                        #PC 280
    jr $ra                                                                                                                                  #PC 284

EXITSAD:
    jr $ra                                                                                                                                  #PC 288

