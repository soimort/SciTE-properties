#!/usr/bin/awk -f
BEGIN {
    FS = ","
    OFS = ","
    inverted["0"] = "F"
    inverted["1"] = "E"
    inverted["2"] = "D"
    inverted["3"] = "C"
    inverted["4"] = "B"
    inverted["5"] = "A"
    inverted["6"] = "9"
    inverted["7"] = "8"
    inverted["8"] = "7"
    inverted["9"] = "6"
    inverted["A"] = inverted["a"] = "5"
    inverted["B"] = inverted["b"] = "4"
    inverted["C"] = inverted["c"] = "3"
    inverted["D"] = inverted["d"] = "2"
    inverted["E"] = inverted["e"] = "1"
    inverted["F"] = inverted["f"] = "0"
}
/#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/ {
    i = 1
    while ($i != "") {
        t = match($i, /#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/)
        if (t) {
            printf("%s", substr($i, 1, t))
            for (j = 0; j < 6; j++)
                printf("%c", inverted[substr($i, t + 1 + j, 1)])
            if (length($i) > t + 7)
                printf("%s", substr($i, t + 7))
        } else {
            printf("%s", $i)
        }
        if (i != NF) printf(",")
        i++
    }
    printf("\n")
}
! /#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/ {
    print
}
