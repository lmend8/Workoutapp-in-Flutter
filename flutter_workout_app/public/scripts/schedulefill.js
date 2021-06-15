/**
 * @author Alexander Gonzales
 */


function fillWeightlossSchedule(schedule, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises) { console.log('hi'); }

/**
 * @author Alexander Gonzales
 */  

function fillToneSchedule(schedule, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises, bodyShapeModifier, toneList) {

    /* lists of cardio exercises, bodyweight exercises, and strength exercises */
    var cardioList = Array();
    var bodyweightList = Array();
    var strengthList = Array();
    var counter = 0;
    

    function release() {
        toneList.cardio = cardioList;
        toneList.bodyweight = bodyweightList;
        toneList.strength = strengthList;
    }

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
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        cardioList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                        console.log("cardio " + counter);
                    }
                }

                /* check database for bodyweight exercises */
                if (exDB.child('type').val() == 'bodyweight') {
                    /* check to see if the user already has this bodyweight exercise */
                    if(!bodyweightList.forEach((exOBJ) => {
                        return ("" + exDB.key) == exOBJ.name; })){

                        /* if not, then copy the details over to list */
                        exOBJ = new Exercise(exDB.key, exDB.child('type').val());
                        exOBJ.muscles = exDB.child('muscles').val();
                        exOBJ.procedure = exDB.child('procedure').val();
                        if (exDB.hasChild('default-time'))
                            exOBJ.time = exDB.child('default-time').val();
                        bodyweightList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                        console.log("bodyweight " + counter);
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
                        if (exDB.hasChild('default-weight'))
                            exOBJ.weight = exDB.child('default-weight').val();
                        if(bodyShapeModifier < 2 || chest < 3) {
                            if(exOBJ.weight <= 30)
                                exOBJ.weight = exOBJ.weight + 5*bodyShapeModifier;
                            else exOBJ.weight = exOBJ.weight + 10*bodyShapeModifier;
                        }
                        strengthList.push(Exercise.copy(exOBJ));
                        exOBJ = null;
                        console.log("strength " + counter);
                    }
                }
                counter++;
            });
            if(counter == snapshot.numChildren()) {
                release();
            }
        }));
    }
}


/**
 * @author Alexander Gonzales
 */
function fillStrengthSchedule(schedule, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises) { console.log('hi'); }
