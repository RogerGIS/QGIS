class QgsHighlight : QgsMapCanvasItem
{
%TypeHeaderCode
#include <qgshighlight.h>
%End
  public:

    /** Constructor for QgsHighlight
     * @param mapCanvas associated map canvas
     * @param geom initial geometry of highlight
     * @param layer associated map layer
     */
    //QgsHighlight( QgsMapCanvas *mapCanvas, const QgsGeometry &geom, QgsMapLayer *layer );

    /** Constructor for QgsHighlight
     * @param mapCanvas associated map canvas
     * @param geom initial geometry of highlight
     * @param layer associated vector layer
     */
    QgsHighlight( QgsMapCanvas *mapCanvas, const QgsGeometry &geom, QgsVectorLayer *layer );

    ~QgsHighlight();

    /** Set line/stroke to color, polygon fill to color with alpha = 63.
     *  This is legacy function, use setFillColor() after setColor() if different fill color is required. */
    void setColor( const QColor &color );

    /** Set polygons fill color.
     * @note: added in version 2.3 */
    void setFillColor( const QColor &fillColor );

    /** Set width. Ignored in feature mode. */
    void setWidth( int width );

    /** Set line / stroke buffer in millimeters.
     *  @note: added in version 2.3 */
    void setBuffer( double buffer );

    /** Set minimum line / stroke width in millimeters.
     *  @note: added in version 2.3 */
    void setMinWidth( double width );

    const QgsMapLayer *layer() const;

    virtual void updatePosition();

  protected:
    virtual void paint( QPainter *p );

    //! recalculates needed rectangle
    void updateRect();
};
