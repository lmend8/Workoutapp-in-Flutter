
class Exercise {

    constructor(name, type) {
        this._name = name;
        this._type = type;
        this._record = new Array();
        this._completions = 0;
        this._disliked = false;
        this._procedure = null;
        this._muscles = 0;
        this._weight = 0;
        this._speed = 0;
        this._reps = 0;
        this._sets = 0;
        this._time = 0;
        this._tutorial = null;
    }

    set disliked(disliked) { this._disliked = disliked; }
    set record(record) { this._record = record; }
    set name(name) { this._name = name; }
    set type(type) { this._type = type; }
    set procedure(procedure) { this._procedure = procedure; }
    set speed(speed) { this._speed = speed; }
    set muscles(muscles) { this._muscles = muscles; }
    set reps(reps) { this._reps = reps; }
    set sets(sets) { this._sets = sets; }
    set time(time) { this._time = time; }
    set weight(weight) { this._weight = weight; }
    set tutorial(tutorial) { this._tutorial = tutorial;}
    
    get disliked() { return this._disliked; }
    get record() {return this._record; }
    get name() { return this._name; }
    get type() { return this._type; }
    get procedure() { return this._procedure; }
    get muscles() { return this._muscles; }
    get speed() { return this._speed; }
    get reps() { return this._reps; }
    get sets() { return this._sets; }
    get time() { return this._time; }
    get weight() { return this._weight; }
    get tutorial() {return this._tutorial; }

    complete() {
        var date = new Date();
        var session;

        if(this._procedure == 'repitition')
            if(this._type == 'strength')
                session = {sets: this._sets, reps: this._reps, weight: this._weight};
            else
                session = {sets: this._sets, reps: this._reps};
      
        if(this._procedure == 'time-seconds')
            session = {sets: this._sets, time: this._time};

        if(this._procedure == 'time-minutes')
            if(this._speed != 0)
                session = {time: this._time, speed: this._speed};
            else
                session = {time: this._time};
        
        let today = {month: date.getMonth(), day: date.getDate(), year: date.getFullYear()};
        this._record.push({date: Object.assign(today), stats: Object.assign(session)});
    }

    static copy(orig) {
        var nuevo = new Exercise(Object.assign(orig.name), Object.assign(orig.type));
        nuevo._procedure = util.trps(orig.procedure);
        nuevo._muscles = util.trps(orig.muscles);
        nuevo._record = util.trps(orig.record);
        nuevo._reps = util.trps(orig.reps);
        nuevo._sets = util.trps(orig.sets);
        nuevo._time = util.trps(orig.time);
        nuevo._record = util.trps(orig.record);
        nuevo._weight = util.trps(orig.weight);
        nuevo._completions = util.trps(orig.completions);
        nuevo._disliked = util.trps(orig.disliked);
        nuevo._tutorial = util.trps(orig.tutorial);
        return nuevo;
    }

    static trps(prop) {
        if (prop == null || prop == 'undefined')
            return null;
        return Object.assign(prop);
    }
}