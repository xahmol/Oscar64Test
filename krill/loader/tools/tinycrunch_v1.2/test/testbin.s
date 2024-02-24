    .import decrunch
    .importzp tc_sp, tc_dp
bmp = $2000

    jsr initscreen

    lda#<(bmp-1)
    sta tc_dp
    lda#>(bmp-1)
    sta tc_dp+1

    lda#<dcSrc
    sta tc_sp
    lda#>dcSrc
    sta tc_sp+1

    jsr decrunch

done:
    jmp done




initscreen:
    lda#11
    sta $d021
    jsr $e536
    lda#$56
    sta $07e7
    lda#$3b
    sta $d011
    lda#$18
    sta $d018
    rts

dcSrc:
    .incbin "../crunched.bin"
