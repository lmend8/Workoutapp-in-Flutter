/**
 * @author Alexander Gonzales
 */


function schedule_weightloss(schedule, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises, bodyShapeModifier) {

    /* lists of cardio exercises, bodyweight exercises, and strength exercises */
    var cardioList = Array();
    var bodyweightList = Array();
    var counter = 0;

    /* put exercises that the user has already done into the lists */
    userExercises.forEach((exOBJ) => {
        
        if (!(counter == userExercises.length)) {   
            if (exOBJ.type == 'cardio')
                cardioList.push(exOBJ);
            if (exOBJ.type == 'bodyweight')
                bodyweightList.push(exOBJ);
            counter++;
        }else readDB();
    });

    if(userExercises.length == 0) readDB();

    function readDB() {
        /* read through database to find exercises that the user has not yet done */
        firebase.database().ref('exercises').once('value').then((function(snapshot) {
            counter = 0;
            var exOBJ;
            /* go through list of default exercises */
            snapshot.forEach((exDB) => {

                /* check database for cardio exercises */
                if (exDB.child('type').val() == 'cardio') {

                    /* check to see if the user already has this bodyweight exercise */
                    if(!cardioList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        cardioList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }

                /* check database for bodyweight exercises */
                if (exDB.child('type').val() == 'bodyweight') {
                    /* check to see if the user already has this bodyweight exercise */
                    if(!bodyweightList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        bodyweightList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }
                counter++;
            });
            if(counter == snapshot.numChildren()) {
                scheduler(schedule, cardioList, bodyweightList, null, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises);
            }
        }));
    }
}

/**
 * @author Alexander Gonzales
 */  

function schedule_tone(schedule, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises, bodyShapeModifier) {

    /* lists of cardio exercises, bodyweight exercises, and strength exercises */
    var cardioList = Array();
    var bodyweightList = Array();
    var strengthList = Array();
    var counter = 0;

    /* put exercises that the user has already done into the lists */
    userExercises.forEach((exOBJ) => {
        
        if (!(counter == userExercises.length)) {   
            if (exOBJ.type == 'cardio')
                cardioList.push(exOBJ);
            if (exOBJ.type == 'bodyweight')
                bodyweightList.push(exOBJ);
            if (exOBJ.type == 'strength')
                strengthList.push(exOBJ);
            counter++;
        }else readDB();
    });
    if(userExercises.length == 0) readDB();

    function readDB() {
        /* read through database to find exercises that the user has not yet done */
        firebase.database().ref('exercises').once('value').then((function(snapshot) {
            counter = 0;
            var exOBJ;
            /* go through list of default exercises */
            snapshot.forEach((exDB) => {

                /* check database for cardio exercises */
                if (exDB.child('type').val() == 'cardio') {

                    /* check to see if the user already has this bodyweight exercise */
                    if(!cardioList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        cardioList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }

                /* check database for bodyweight exercises */
                if (exDB.child('type').val() == 'bodyweight') {
                    /* check to see if the user already has this bodyweight exercise */
                    if(!bodyweightList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        bodyweightList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }

                /* check database for strength exercises */
                if (exDB.child('type').val() == 'strength') {
                    
                    /* check to see if the user already has this bodyweight exercise */
                    if(!strengthList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-weight'))
                            exOBJ.weight = exDB.child('default-weight').val();
                        if(bodyShapeModifier < 2 || chest < 3) {
                            if(exOBJ.weight <= 30)
                                exOBJ.weight = exOBJ.weight + 5*bodyShapeModifier;
                            else exOBJ.weight = exOBJ.weight + 10*bodyShapeModifier;
                        }
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        strengthList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }
                counter++;
            });
            if(counter == snapshot.numChildren()) {
                scheduler(schedule, cardioList, bodyweightList, strengthList, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises);
            }
        }));
    }
}


/**
 * @author Alexander Gonzales
 */
function schedule_gainmass(schedule, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises, bodyShapeModifier) {

    /* lists of cardio exercises, bodyweight exercises, and strength exercises */
    var bodyweightList = Array();
    var strengthList = Array();
    var counter = 0;
    
    /* put exercises that the user has already done into the lists */
    userExercises.forEach((exOBJ) => {
        
        if (!(counter == userExercises.length)) {   
            if (exOBJ.type == 'bodyweight')
                bodyweightList.push(exOBJ);
            if (exOBJ.type == 'strength')
                strengthList.push(exOBJ);
            counter++;
        }else readDB();
    });
    if(userExercises.length == 0) readDB();

    function readDB() {
        /* read through database to find exercises that the user has not yet done */
        firebase.database().ref('exercises').once('value').then((function(snapshot) {
            counter = 0;
            var exOBJ;
            /* go through list of default exercises */
            snapshot.forEach((exDB) => {

                /* check database for bodyweight exercises */
                if (exDB.child('type').val() == 'bodyweight') {
                    /* check to see if the user already has this bodyweight exercise */
                    if(!bodyweightList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial'))
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        bodyweightList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }

                /* check database for strength exercises */
                if (exDB.child('type').val() == 'strength') {
                    
                    /* check to see if the user already has this bodyweight exercise */
                    if(!strengthList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                    /* if not, then copy the details over to list */
                        exOBJ = new Exercise("" + exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if(exDB.hasChild('tutorial')) {
                            exOBJ.tutorial = exDB.child('tutorial').val();
                        }
                        if (exDB.hasChild('default-weight'))
                            exOBJ.weight = exDB.child('default-weight').val();
                        if(bodyShapeModifier < 2 || chest < 3) {
                            if(exOBJ.weight <= 30)
                                exOBJ.weight = exOBJ.weight + 5*bodyShapeModifier;
                            else exOBJ.weight = exOBJ.weight + 10*bodyShapeModifier;
                        }
                        exOBJ.sets = 3;
                        exOBJ.reps = 10;
                        strengthList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                    }
                }
                counter++;
            });
            if(counter == snapshot.numChildren()) {
                scheduler(schedule, null, bodyweightList, strengthList, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises);
            }
        }));
    }
}