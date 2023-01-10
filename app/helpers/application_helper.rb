module ApplicationHelper
    def ms_to_time(milliseconds)
        seconds = milliseconds / 1000
        minutes = seconds.divmod(60)[0]
        hours = minutes.divmod(60)

        if hours[0] > 0
            return "#{pluralize(hours[0], "hour")} #{pluralize(hours[1], "minute")}"
        end

        return "#{pluralize(minutes, "minute")}"
    end
end
