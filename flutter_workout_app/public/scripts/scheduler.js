function scheduler(schedule, cardioList, bodyweightList, strengthList, plan, dayCount, bodyFat, shoulders, legs, arms, back, chest, userExercises) {

    var taken = new Array();
    var cardioWeek = null;
    var bodyweightWeek = null;
    var strengthWeek = null;

    /* add cardio exercises to week */
    cardioWeek = new Array();
    if(cardioList != null) {
        var cardioDay = new Array();
        plan.cardioBlock.forEach( day => {
            for(i = 0; i < (plan.cardioBlock[0][0]/10); i++) {
                do {
                    target = cardioList[Math.floor(Math.random() * cardioList.length)];
                } while (util.included(taken, target.name));
                taken.push(Exercise.copy(target));
                target.time = (plan.cardioBlock[0][0]/plan.cardioBlock[0][1]);
                cardioDay.push(Exercise.copy(target));
            }
            cardioWeek.push(util.copyArr(cardioDay));
            cardioDay = new Array();
            taken = new Array();
        });
    }

    /* Add bodyweight exercises to week */
    bodyweightWeek = new Array();
    plan.bodyweightBlock.forEach( day => {
        var bodyweightDay = new Array();
        for(i = 0; i < plan.bodyweightBlock[0][0]/5; i++) {
            do {
                target = bodyweightList[Math.floor(Math.random() * bodyweightList.length)];
            } while (util.included(taken, target.name));
            taken.push(Exercise.copy(target));
            bodyweightDay.push(Exercise.copy(target));
        }
        bodyweightWeek.push(util.copyArr(bodyweightDay));
        bodyweightDay = new Array();
        taken = new Array();
    });
    
    /* Add strength exercises to week */
    strengthWeek = new Array();
    if(strengthList != null) {
        var strengthDay = new Array();
        plan.strengthBlock.forEach( day => {
            for(i = 0; i < plan.strengthBlock[0][0]/5; i++) {
                do {
                    target = strengthList[Math.floor(Math.random() * strengthList.length)];
                } while (util.included(taken, target.name));
                taken.push(Exercise.copy(target));
                strengthDay.push(Exercise.copy(target));
            }
            strengthWeek.push(util.copyArr(strengthDay));
            strengthDay = new Array();
            taken = new Array();
        });
    }
    var session = new Array();

    if(strengthList == null) {
        for(i = 0; i < bodyweightWeek.length; i++) {
            for(j = 0; j < cardioWeek[i].length; j++) session.push(cardioWeek[i][j]);
            for(j = 0; j < bodyweightWeek[i].length; j++) session.push(bodyweightWeek[i][j]);
            schedule.push(util.copyArr(session));
            session = new Array();
        }
    }else if(cardioList == null) {
        for(i = 0; i < bodyweightWeek.length; i++) {
            for(j = 0; j < bodyweightWeek[i].length; j++) session.push(bodyweightWeek[i][j]);
            for(j = 0; j < strengthWeek[i].length; j++) session.push(strengthWeek[i][j]);
            schedule.push(util.copyArr(session));
            session = new Array();
        }
    }else {
        for(i = 0; i < bodyweightWeek.length; i++) {
            for(j = 0; j < cardioWeek[i].length; j++) session.push(cardioWeek[i][j]);
            for(j = 0; j < bodyweightWeek[i].length; j++) session.push(bodyweightWeek[i][j]);
            for(j = 0; j < strengthWeek[i].length; j++) session.push(strengthWeek[i][j]);
            schedule.push(util.copyArr(session));
            session = new Array();
        }
    }
}


    