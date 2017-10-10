<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : bookings.xsl
    Author     : Dallas Symons
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    
    
    
    <xsl:template match="bookings/booking">
        <table>
            <thead>
                <tr>
                    <th>BookingID</th>
                    <th>Student Name</th>
                    <th>Student Email</th>
                    <th>Tutor Name</th>
                    <th>Tutor Email</th>
                    <th>Subject</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
            
    <xsl:template match="booking/bookingID|studentName|studentEmail">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

</xsl:stylesheet>
