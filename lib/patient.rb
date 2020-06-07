class Patient

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        return @@all
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        return Appointment.all.select {|appt| appt.patient == self}
    end

    def doctors
        return appointments.map {|appt| appt.doctor}
    end

end