/*
* For each of the fitness goals, the workout session is separated into blocks
* the length of the block is dependent on the time a user wants to spend exercising
* the format of the block is <type>Block[minutes, exercises]
* Cardio exercises will generally take either 10 for 15 minutes, while bodyweight and strength exercises will take 5 minutes
*/

/*
* The weightloss goal is split between cardio and bodyweight
*/
function plan_weightloss(plan, exerciseTime, dayCount) {

    switch(exerciseTime) {

        case 30:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([15, 1]);
                plan.bodyweightBlock.push([15, 3]);
            }
            break;

        case 45:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([20, 2]);
                plan.bodyweightBlock.push([25, 5]);
            }
            break;

        case 60:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([30, 3]);
                plan.bodyweightBlock.push([30, 6]);
            }
            break;
    }
}


/*
* The tone goal is split between cardio, bodyweight, and strength
*/
function plan_tone(plan, exerciseTime, dayCount) {

    switch(exerciseTime) {

        case 30:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([10, 1]);
                plan.bodyweightBlock.push([10, 2]);
                plan.strengthBlock.push([10, 2]);
            }
            break;

        case 45:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([15, 1]);
                plan.bodyweightBlock.push([15, 3]);
                plan.strengthBlock.push([15, 3]);
            }
            break;

        case 60:
            for(i = 0; i < dayCount; i++) {
                plan.cardioBlock.push([20, 2]);
                plan.bodyweightBlock.push([20, 4]);
                plan.strengthBlock.push([20, 4]);
            }
            break;
    }
}

/*
* The gain muscle mass goal is split between bodyweight and strength exercises; cardio kills gainz
*/
function plan_gainmass(plan, exerciseTime, dayCount) {
    switch(exerciseTime) {

        case 30:
            for(i = 0; i < dayCount; i++) {
                plan.bodyweightBlock.push([15, 3]);
                plan.strengthBlock.push([15, 3]);
            }
            break;

        case 45:
            for(i = 0; i < dayCount; i++) {
                plan.bodyweightBlock.push([20, 4]);
                plan.strengthBlock.push([25, 5]);
            }
            break;
            
        case 60:
            for(i = 0; i < dayCount; i++) {
                plan.bodyweightBlock.push([30, 6]);
                plan.strengthBlock.push([30, 6]);
            }
            break;
    }
}