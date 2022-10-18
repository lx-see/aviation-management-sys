package com.groupone.aviationsys.api.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
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
public class Airport extends Model<Airport> {

	private static final long serialVersionUID = 1L;

	/**
	 * Unique OpenFlights identifier for this airport.
	 */
	@TableId(value = "airportId", type = IdType.AUTO)
	private Integer airportId;

	/**
	 * Name of airport. May or may not contain the City name.
	 */
	private String name;

	/**
	 * Main city served by airport. May be spelled differently from Name.
	 */
	private String city;

	/**
	 * Country or territory where airport is located.
	 */
	private String country;

	/**
	 * 3-letter IATA code. Null if not assigned/unknown.
	 */
	@TableField("IATA")
	private String iata;

	/**
	 * 4-letter ICAO code. Null if not assigned.
	 */
	@TableField("ICAO")
	private String icao;

	/**
	 * Decimal degrees, usually to six significant digits. Negative is South,
	 * positive is North.
	 */
	private Float latitude;

	/**
	 * Decimal degrees, usually to six significant digits. Negative is West,
	 * positive is East.
	 */
	private Float longitude;

	/**
	 * In feet.
	 */
	private Integer altitude;

	/**
	 * Hours offset from UTC. Fractional hours are expressed as decimals, eg. India
	 * is 5.5.
	 */
	private Float timezone;

	/**
	 * Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O
	 * (Australia), Z (New Zealand), N
	 */
	private String dst;

	/**
	 * Timezone in "tz" (Olson) format.
	 */
	private String timezoneTz;

	@Override
	protected Serializable pkVal() {
		return this.airportId;
	}

}
