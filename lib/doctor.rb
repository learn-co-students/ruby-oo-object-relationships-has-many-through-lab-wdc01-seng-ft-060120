require 'pry'

class Doctor

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        return @@all
    end

    def appointments
        return Appointment.all.select {|appt| appt.doctor == self}
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        #binding.pry
        appointments.map {|appt| appt.patient}
    end

end