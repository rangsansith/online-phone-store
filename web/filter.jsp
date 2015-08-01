<%-- 
    Document   : filter
    Created on : Jul 26, 2015, 3:23:09 AM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <form name="filterform" action="filter" method="post">
        <table  border="1">
            <tr>
                <td>
                    <select name="screen">
                        <option value="screen">Screen Size</option>
                        <option value="3in">3 in</option>
                        <option value="4in">4 in</option>
                        <option value="5in">5 in</option>
                        <option value="6in">6 in</option>
                        <option value="7in">7 in</option>
                        <option value="8in">8 in</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="rom">
                        <option value="rom">Phone Memory</option>
                        <option value="4gb">4 GB</option>
                        <option value="8gb">8 GB</option>
                        <option value="16gb">16 GB</option>
                        <option value="32gb">32 GB</option>
                        <option value="64gb">64 GB</option>
                        <option value="128gb">128 GB</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="ram">
                        <option value="ram">RAM</option>
                        <option value="512mb">512 MB</option>
                        <option value="1gb">1 GB</option>
                        <option value="2gb">2 GB</option>
                        <option value="4gb">4 GB</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="processor">
                        <option value="processor">Processor</option>
                        <option value="1ghz">1 GHz</option>
                        <option value="1.2ghz">1.2 GHz</option>
                        <option value="2GHz">2 GHz</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="os">
                        <option value="operatingsys">Operating System</option>
                        <option value="android">Android</option>
                        <option value="ios">iOS</option>
                        <option value="symbian">Symbian</option>
                        <option value="blackberry">Blackberry</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="priCam">
                        <option value="priCam">Primary Camera</option>
                        <option value="vga">VGA</option>
                        <option value="2mp">2 MP</option>
                        <option value="5mp">5 MP</option>
                        <option value="8mp">8 MP</option>
                        <option value="13mp">13 MP</option>
                        <option value="20mp">20 MP</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select name="secCam">
                        <option value="secCam">Front Camera</option>
                        <option value="vga">VGA</option>
                        <option value="2mp">2 MP</option>
                        <option value="5mp">5 MP</option>
                        <option value="8mp">8 MP</option>
                        <option value="13mp">13 MP</option>
                        <option value="20mp">20 MP</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td>
                    <input type="submit" name="filter" value="Filter"/>
                </td>
            </tr>
        </table>
        </form>
        
    </body>
</html>
