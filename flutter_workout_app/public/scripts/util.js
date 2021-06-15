class util {
    static trps(prop) {
        if (prop == null || prop == 'undefined')
            return null;
        return Object.assign(prop);
    }

    static daysDB_Arr(chld) {
        var woDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        var dc = 0;
        var i = 0;
        chld.forEach(function(daybool) {
            if (daybool.val()) {
                woDays[dc] = woDays[i];
                dc++;
            }
            i++;
        });
        return woDays.slice(0, dc);
    }
    static included (exerciseArr, exerName) {
        var there = false;
        exerciseArr.forEach(exerOut => {
            if(exerOut.name == exerName) there = true;
        });
        return there;
    }

    static copyArr(orig) {
        var nuevoArr = new Array();
        orig.forEach(exer => {
            nuevoArr.push(Exercise.copy(exer));
        });
        return nuevoArr;
    }
}