class Doctor

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient,date)
        Appointment.new(date,patient,self)
    end

    def appointments
        Appointment.all.select{|appt| appt.doctor == self}
    end

    def patients
        patients = []

        self.appointments.each do |appt|
            if !patients.include? appt.patient
                patients << appt.patient
            end
        end
        return patients
    end

end