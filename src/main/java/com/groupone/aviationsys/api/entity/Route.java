package com.groupone.aviationsys.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import javax.validation.constraints.*;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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
public class Route extends Model<Route> {

	private static final long serialVersionUID = 1L;

	/**
	 * Unique OpenFlights identifier for this route.
	 */
	@TableId(value = "routeId", type = IdType.AUTO)
	@NotEmpty
	private Integer routeId;

	/**
	 * Unique OpenFlights identifier for source airport.
	 */
	@TableField("sourceAirportId")
	@NotEmpty
	private Integer sourceAirportId;

	/**
	 * 3-letter (IATA) or 4-letter (ICAO) code of the destination airport.
	 */
	@TableField("destAirportId")
	@NotEmpty
	private Integer destAirportId;

	/**
	 * 3-letter (IATA) or 4-letter (ICAO) code of the source airport.
	 */
	@TableField("sourceAirportIATA_ICAO")
	@NotEmpty
	@Size(min = 3, max = 5)
	private String sourceairportiataIcao;

	/**
	 * 3-letter (IATA) or 4-letter (ICAO) code of the destination airport.
	 */
	@TableField("destAirportIATA_ICAO")
	@NotEmpty
	@Size(min = 3, max = 5)
	private String destairportiataIcao;

	/**
	 * "Y" if this flight is a codeshare (that is, not operated by Airline, but
	 * another carrier), empty
	 */
	private String codeshare;

	/**
	 * Number of stops on this flight ("0" for direct).
	 */
	private Integer stops;

	/**
	 * 3-letter codes for plane type(s) generally used on this flight, separated by
	 * spaces.
	 */
	private String equipment;

	/**
	 * Unique OpenFlights identifier for this airline.
	 */
	@TableField("airlineId")
	@NotEmpty
	private Integer airlineId;

	/**
	 * 2-letter IATA code or 3-letter ICAO code of this airline.
	 */
	@TableField("airlineIATA_ICAO")
	@NotEmpty
	@Size(min = 3, max = 5)
	private String airlineiataIcao;

	@Override
	protected Serializable pkVal() {
		return this.routeId;
	}

}
