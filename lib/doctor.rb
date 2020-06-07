
class Doctor
    attr_accessor :name
    
    @@all = []
    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor = self
        end
    end

    def new_appointment(patient, date)
        appointment = Appointment.new(date, patient, self)
    end

    def patients
        appointments.collect do |app|
            app.patient
        end
    end
end