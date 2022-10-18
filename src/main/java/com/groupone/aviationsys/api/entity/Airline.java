package com.groupone.aviationsys.api.entity;

    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.extension.activerecord.Model;
    import com.baomidou.mybatisplus.annotation.TableName;
    import com.baomidou.mybatisplus.annotation.TableField;
    import com.baomidou.mybatisplus.annotation.TableId;

    import java.io.Serializable;
    import lombok.Data;


/**
* <p>
    * 
    * </p>
*
* @author LXSee
* @since 2021-10-26
*/
    @Data
    @TableName(value = "airline")
    public class Airline implements Serializable{
    	
    	@TableField(value = "airlineId")
    	 /**
         * Unique OpenFlights identifier for this airline.
         */
    	@TableId(value = "airlineId", type = IdType.AUTO)
    	
    	 private Integer airlineId;

        /**
        * Name of the airline.
        */
private String name;

        /**
        * Alias of the airline.
        */
	@TableField("alias")
private String alias;

        /**
        * 2-letter IATA code, if available.
        */
    @TableField("IATA")
private String iata;

        /**
        * 3-letter ICAO code, if available.
        */
    @TableField("ICAO")
private String icao;

        /**
        * Airline callsign.
        */
    @TableField("callSign")
private String callSign;

        /**
        * Country or territory where airline is incorporated.
        */
private String country;

        /**
        * "Y" if the airline is or has until recently been operational, "N" if it is defunct.
        */
private String active;



}
    	
  