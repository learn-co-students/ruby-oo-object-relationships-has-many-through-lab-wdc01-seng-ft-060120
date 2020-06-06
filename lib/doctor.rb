require 'pry'
require_relative "./patient.rb"
require_relative "./appointment.rb"

class Doctor
    attr_accessor :name
    @@all = [ ] 

    def initialize(name)
        @name = name
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def appointments
        Appointment.all.select {|appt| appt.doctor == self}
    end 

    def new_appointment(date, patient)
        new_appt = Appointment.new(patient, date, self)
    end 

    def patients
        appointments.map {|appt| appt.patient }
    end 

end 