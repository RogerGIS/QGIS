/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsscalecalculator.h                                        *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/





class QgsScaleCalculator
{
%Docstring
 Calculates scale for a given combination of canvas size, map extent,
 and monitor dpi.
%End

%TypeHeaderCode
#include "qgsscalecalculator.h"
%End
  public:

    QgsScaleCalculator( double dpi = 0,
                        QgsUnitTypes::DistanceUnit mapUnits = QgsUnitTypes::DistanceMeters );
%Docstring
 Constructor
 \param dpi Monitor resolution in dots per inch
 \param mapUnits Units of the data on the map
%End

    void setDpi( double dpi );
%Docstring
 Set the dpi to be used in scale calculations
 \param dpi Dots per inch of monitor resolution
%End

    double dpi();
%Docstring
 Accessor for dpi used in scale calculations
 :return: int the dpi used for scale calculations.
 :rtype: float
%End

    void setMapUnits( QgsUnitTypes::DistanceUnit mapUnits );
%Docstring
 Set the map units
 \param mapUnits Units of the data on the map. Must match a value from the
%End

    QgsUnitTypes::DistanceUnit mapUnits() const;
%Docstring
Returns current map units
 :rtype: QgsUnitTypes.DistanceUnit
%End

    double calculate( const QgsRectangle &mapExtent, int canvasWidth );
%Docstring
 Calculate the scale denominator
 \param mapExtent QgsRectangle containing the current map extent
 \param canvasWidth Width of the map canvas in pixel (physical) units
 :return: scale denominator of current map view
 :rtype: float
%End

    double calculateGeographicDistance( const QgsRectangle &mapExtent );
%Docstring
 Calculate the distance between two points in geographic coordinates.
 Used to calculate scale for map views with geographic (decimal degree)
 data.
 \param mapExtent QgsRectangle containing the current map extent
 :rtype: float
%End

};

/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgsscalecalculator.h                                        *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
