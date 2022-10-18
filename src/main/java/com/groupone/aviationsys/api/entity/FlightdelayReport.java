package com.groupone.aviationsys.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@NoArgsConstructor()
@AllArgsConstructor()
public class FlightdelayReport {
    private Integer flightId;
    private String date;
    private String sourceAirport;
    private String destAirport;
    private String scheduledDeparture;
    private String departureDelay;
    private String scheduledTime;
    private String scheduledArrival;
    private String airline;
    private String tailNumber;
    private String departureTime;
    private String elapsedTime;
    private String arrivalTime;
    private String arrivalDelay;
    private Integer distance;
    private String diverted;
    private String cancelled;
}
