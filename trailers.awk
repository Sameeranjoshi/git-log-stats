#!/usr/bin/awk -f
#https://stackoverflow.com/questions/65377951/trailers-option-in-git-pretty-option/65380227?noredirect=1#comment115613691_65380227

BEGIN {
    RS = "\x1E"
    FS = "\x1F"
    OFS = "\x09"
}

function extract(array, trailer_key, __buffer) {
    for ( i in array ) {
        if ( index(array[i], trailer_key) > 0 ) {
            if ( length(__buffer) > 0 ) {
                __buffer = __buffer ","
            }
            __buffer = __buffer substr(array[i], length(trailer_key))
        }
    }
    return __buffer
}

NF > 1 {
    split($6, array, "\n")

    keyValuePairFromCommitMsg_ = extract(array, "Differential Revision: ")    
    # There are a few commits which were reviewed on github before merging flang into monorepo.
    # They follow a different convention.
    if (extract(array, "Reviewed-on: ")) {
	keyValuePairFromCommitMsg_ = extract(array, "Reviewed-on: ")
    }
    print $1, $2, $3, $4, $5, keyValuePairFromCommitMsg_
}
