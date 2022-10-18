package com.groupone.aviationsys.api.entity;

    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.extension.activerecord.Model;
    import java.time.Year;
    import com.baomidou.mybatisplus.annotation.TableId;
    import java.time.LocalTime;
    import com.baomidou.mybatisplus.annotation.TableField;
    import java.io.Serializable;

    import lombok.AllArgsConstructor;
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.NoArgsConstructor;
    import lombok.experimental.Accessors;

    import javax.validation.constraints.NotBlank;
    import javax.validation.constraints.Size;

/**
* <p>
    * 
    * </p>
*
* @author LXSee
* @since 2021-10-26
*/
    @Data
        @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    @NoArgsConstructor()
    @AllArgsConstructor()
    public class Flightdelay extends Model<Flightdelay> {

    private static final long serialVersionUID = 1L;

            /**
            * Unique OpenFlights identifier for this flight.
            */
            @TableId(value = "flightId", type = IdType.AUTO)
    private Integer flightId;

            /**
            * Year of the Flight Trip.
            */
    private Year year;

            /**
            * Month of the Flight Trip.
            */
    private Integer month;

            /**
            * Day of the Flight Trip.
            */
    private Integer day;

            /**
            * Day of week of the Flight Trip.
            */
        @TableField("dayOfWeek")
    private Integer dayOfWeek;
            /**
            * 3-letter IATA code of the source airport.
            */
        @TableField("sourceAirportIATA")
        @Size(min = 3, max = 3)
        @NotBlank(message = "Source Airport is mandatory")
        private String sourceAirportIATA;

            /**
            * 3-letter IATA code of the destination airport.
            */
        @TableField("destAirportIATA")
        @Size(min = 3, max = 3)
        @NotBlank(message = "Destination Airport is mandatory")
        private String destAirportIATA;

            /**
            * Planned Departure Time in format hh:mm.
            */
        @TableField("scheduledDeparture")
        @NotBlank(message = "Scheduled Departure is mandatory")
        private LocalTime scheduledDeparture;

            /**
            * Total Delay on Departure in minutes.
            */
        @TableField("departureDelay")
    private Integer departureDelay;

            /**
            * The time duration elapsed between departure from the origin airport gate and wheels off in minutes.
            */
        @TableField("taxiOut")
    private Integer taxiOut;

            /**
            * The time point that the aircraft's wheels leave the ground in fotmat hh:mm.
            */
        @TableField("wheelsOff")
    private LocalTime wheelsOff;

            /**
            * Planned time amount needed for the flight trip in minutes.
            */
        @TableField("scheduledTime")
    private Integer scheduledTime;

            /**
            * The time duration between wheels_off and wheels_on time in minutes.
            */
        @TableField("airTime")
    private Integer airTime;

            /**
            * Distance between two airports in km.
            */
          @NotBlank(message = "Distance is mandatory")
    private Integer distance;


            /**
            * The time point that the aircraft's wheels touch on the ground in format hh:mm.
            */
        @TableField("wheelsOn")
    private LocalTime wheelsOn;

            /**
            * The time duration elapsed between wheels-on and gate arrival at the destination airport in minutes.
            */
        @TableField("taxiIn")
    private Integer taxiIn;

            /**
            * Planned arrival time in format hh:mm.
            */
        @TableField("scheduledArrival")
        @NotBlank(message = "Scheduled Arrival is mandatory")
        private LocalTime scheduledArrival;

            /**
            * Aircraft landed on airport that out of schedule. (1 = Diverted)
            */
    private Boolean diverted;

            /**
            * Flight Cancelled (1 = cancelled)
            */
    private Boolean cancelled;

            /**
            * Reason for Cancellation of flight: A - Airline/Carrier; B - Weather; C - National Air System; D - Security
            */
        @TableField("cancellationReason")
    private String cancellationReason;

            /**
            * Delay caused by air system in minutes.
            */
        @TableField("airSysDelay")
    private Integer airSysDelay;

            /**
            * Delay caused by security in minutes.
            */
        @TableField("securityDelay")
    private Integer securityDelay;

            /**
            * Delay caused by the airline in minutes
            */
        @TableField("airlineDelay")
    private Integer airlineDelay;

            /**
            * Delay caused by aircraft in minutes
            */
        @TableField("lateAircraftDelay")
    private Integer lateAircraftDelay;

            /**
            * Delay caused by weather in minutes.
            */
        @TableField("weatherDelay")
    private Integer weatherDelay;

            /**
             * Delay caused by weather in minutes.
             */
            @TableField("airlineIATA")
            @NotBlank(message = "Airline is mandatory")
    private String airlineIATA;

            /**
             * Delay caused by weather in minutes.
             */
            @TableField("tailNumber")
            @NotBlank(message = "Tail Number is mandatory")
    private String tailNumber;

            /**
             * Derived attributes
             */

            @TableField(exist = false)
    private LocalTime departureTime;
            @TableField(exist = false)
    private Integer elapsedTime;
            @TableField(exist = false)
    private LocalTime arrivalTime;
            @TableField(exist = false)
    private Integer arrivalDelay;

    @Override
    protected Serializable pkVal() {
        return this.flightId;
    }

    @Override
    public String toString() {
        return "Flightdelay{" +
                "flightId=" + flightId +
                ", year=" + year +
                ", month=" + month +
                ", day=" + day +
                ", dayOfWeek=" + dayOfWeek +
                ", sourceAirportIATA='" + sourceAirportIATA + '\'' +
                ", destAirportIATA='" + destAirportIATA + '\'' +
                ", scheduledDeparture=" + scheduledDeparture +
                ", departureDelay=" + departureDelay +
                ", taxiOut=" + taxiOut +
                ", wheelsOff=" + wheelsOff +
                ", scheduledTime=" + scheduledTime +
                ", airTime=" + airTime +
                ", distance=" + distance +
                ", wheelsOn=" + wheelsOn +
                ", taxiIn=" + taxiIn +
                ", scheduledArrival=" + scheduledArrival +
                ", diverted=" + diverted +
                ", cancelled=" + cancelled +
                ", cancellationReason='" + cancellationReason + '\'' +
                ", airSysDelay=" + airSysDelay +
                ", securityDelay=" + securityDelay +
                ", airlineDelay=" + airlineDelay +
                ", lateAircraftDelay=" + lateAircraftDelay +
                ", weatherDelay=" + weatherDelay +
                ", airlineIATA='" + airlineIATA + '\'' +
                ", tailNumber='" + tailNumber + '\'' +
                ", departureTime=" + departureTime +
                ", elapsedTime=" + elapsedTime +
                ", arrivalTime=" + arrivalTime +
                ", arrivalDelay=" + arrivalDelay +
                '}';
    }
}
