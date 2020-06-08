class Patient
    attr_accessor :name

    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointment| appointment.patient == self}
    end

    def new_appointment (doctor, date)
        Appointment.new(date, self, doctor)
    end

    def doctors
        self.appointments.map {|appointment| appointment.doctor}
    end
    
end