class Patient

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor,date)
        Appointment.new(date,self,doctor)
    end

    def appointments
        Appointment.all.select{|appt|appt.patient == self}
    end

    def doctors
        docs = []
        self.appointments.each do |appt|
            if !docs.include? appt.doctor
                docs << appt.doctor
            end
        end
        return docs
    end
end
