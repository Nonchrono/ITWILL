// myscript.js

function hap(a, b) { // 두수 사이의 합을 반환하시오
    // 2+3+4+5
    // 5+4+3+2

    let sum = 0;

    if (a > b) {
        let tmp = a;
        a = b;
        b = tmp;
    }

    for (let n = a; n <= b; n++) {
        sum = sum + n;
    }
    return sum;
} // hap() end


function diff(a, b) { // 두 수 사이의 차이를 반환하시오
    // 2, 5
    // 5, 2
    let abs = Math.abs(a - b);
    return abs;
} // diff end


function leap(year) {
    if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
        return true;
    } else {
        return false;
    } // if end
} // leap() end

