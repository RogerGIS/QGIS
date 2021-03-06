class QgsSymbolLayerUtils
{
%TypeHeaderCode
#include <qgssymbollayerutils.h>
%End

  public:

    static QString encodeColor( const QColor &color );
    static QColor decodeColor( const QString &str );

    static QString encodeSldAlpha( int alpha );
    static int decodeSldAlpha( const QString &str );

    static QString encodeSldFontStyle( QFont::Style style );
    static QFont::Style decodeSldFontStyle( const QString &str );

    static QString encodeSldFontWeight( int weight );
    static int decodeSldFontWeight( const QString &str );

    static QString encodePenStyle( Qt::PenStyle style );
    static Qt::PenStyle decodePenStyle( const QString &str );

    static QString encodePenJoinStyle( Qt::PenJoinStyle style );
    static Qt::PenJoinStyle decodePenJoinStyle( const QString &str );

    static QString encodePenCapStyle( Qt::PenCapStyle style );
    static Qt::PenCapStyle decodePenCapStyle( const QString &str );

    static QString encodeSldLineJoinStyle( Qt::PenJoinStyle style );
    static Qt::PenJoinStyle decodeSldLineJoinStyle( const QString &str );

    static QString encodeSldLineCapStyle( Qt::PenCapStyle style );
    static Qt::PenCapStyle decodeSldLineCapStyle( const QString &str );

    static QString encodeBrushStyle( Qt::BrushStyle style );
    static Qt::BrushStyle decodeBrushStyle( const QString &str );

    static QString encodeSldBrushStyle( Qt::BrushStyle style );
    static Qt::BrushStyle decodeSldBrushStyle( const QString &str );

    /** Encodes a QPointF to a string.
     * @see decodePoint()
     * @see encodeSize()
     */
    static QString encodePoint( QPointF point );

    /** Decodes a QSizeF from a string.
     * @see encodePoint()
     * @see decodeSize()
     */
    static QPointF decodePoint( const QString &string );

    /** Encodes a QSizeF to a string.
     * @see decodeSize()
     * @see encodePoint()
     * @note added in QGIS 3.0
     */
    static QString encodeSize( QSizeF size );

    /** Decodes a QSizeF from a string.
     * @see encodeSize()
     * @see decodePoint()
     * @note added in QGIS 3.0
     */
    static QSizeF decodeSize( const QString &string );

    static QString encodeMapUnitScale( const QgsMapUnitScale &mapUnitScale );
    static QgsMapUnitScale decodeMapUnitScale( const QString &str );

    static QString encodeRealVector( const QVector<qreal> &v );
    static QVector<qreal> decodeRealVector( const QString &s );

    static QString encodeSldRealVector( const QVector<qreal> &v );
    static QVector<qreal> decodeSldRealVector( const QString &s );

    /** Encodes a render unit into an SLD unit of measure string.
     * @param unit unit to encode
     * @param scaleFactor if specified, will be set to scale factor for unit of measure
     * @returns encoded string
     * @see decodeSldUom()
     */
    static QString encodeSldUom( QgsUnitTypes::RenderUnit unit, double *scaleFactor );

    /** Decodes a SLD unit of measure string to a render unit.
     * @param str string to decode
     * @param scaleFactor if specified, will be set to scale factor for unit of measure
     * @returns matching render unit
     * @see encodeSldUom()
     */
    static QgsUnitTypes::RenderUnit decodeSldUom( const QString &str, double *scaleFactor );

    /** Returns the size scaled in pixels according to the uom attribute.
     * \param uom The uom attribute from SLD 1.1 version
     * \param size The original size
     * \returns the size in pixels
     * \since QGIS 3.0
     */
    static double sizeInPixelsFromSldUom( const QString &uom, double size );

    static QString encodeScaleMethod( QgsSymbol::ScaleMethod scaleMethod );
    static QgsSymbol::ScaleMethod decodeScaleMethod( const QString &str );

    static QPainter::CompositionMode decodeBlendMode( const QString &s );

    /** Returns an icon preview for a color ramp.
     * @param symbol symbol
     * @param size target pixmap size
     * @param padding space between icon edge and symbol
     * @see symbolPreviewPixmap()
     */
    static QIcon symbolPreviewIcon( QgsSymbol *symbol, QSize size, int padding = 0 );

    /** Returns a pixmap preview for a color ramp.
     * @param symbol symbol
     * @param size target pixmap size
     * @param padding space between icon edge and symbol
     * @param customContext render context to use when rendering symbol
     * @note customContext parameter added in 2.6
     * @see symbolPreviewIcon()
     */
    static QPixmap symbolPreviewPixmap( QgsSymbol *symbol, QSize size, int padding = 0, QgsRenderContext *customContext = 0 );

    /** Draws a symbol layer preview to a QPicture
     * @param layer symbol layer to draw
     * @param units size units
     * @param size target size of preview picture
     * @param scale map unit scale for preview
     * @returns QPicture containing symbol layer preview
     * @note added in QGIS 2.9
     * @see symbolLayerPreviewIcon()
     */
    static QPicture symbolLayerPreviewPicture( QgsSymbolLayer *layer, QgsUnitTypes::RenderUnit units, QSize size, const QgsMapUnitScale &scale = QgsMapUnitScale() );

    /** Draws a symbol layer preview to an icon.
     * @param layer symbol layer to draw
     * @param u size units
     * @param size target size of preview icon
     * @param scale map unit scale for preview
     * @returns icon containing symbol layer preview
     * @see symbolLayerPreviewPicture()
     */
    static QIcon symbolLayerPreviewIcon( QgsSymbolLayer *layer, QgsUnitTypes::RenderUnit u, QSize size, const QgsMapUnitScale &scale = QgsMapUnitScale() );

    /** Returns a icon preview for a color ramp.
     * @param ramp color ramp
     * @param size target icon size
     * @param padding space between icon edge and symbol
     * @see colorRampPreviewPixmap()
     */
    static QIcon colorRampPreviewIcon( QgsColorRamp *ramp, QSize size, int padding = 0 );
    /** Returns a pixmap preview for a color ramp.
     * @param ramp color ramp
     * @param size target pixmap size
     * @param padding space between icon edge and symbol
     * @see colorRampPreviewIcon()
     */
    static QPixmap colorRampPreviewPixmap( QgsColorRamp *ramp, QSize size, int padding = 0 );

    static void drawStippledBackground( QPainter *painter, QRect rect );

    /** Returns the maximum estimated bleed for the symbol */
    static double estimateMaxSymbolBleed( QgsSymbol *symbol, const QgsRenderContext &context );

    /** Attempts to load a symbol from a DOM element
     * @param element DOM element representing symbol
     * @returns decoded symbol, if possible
     */
    static QgsSymbol* loadSymbol( const QDomElement& element, const QgsReadWriteContext &context ) /Factory/;

    /** Attempts to load a symbol from a DOM element and cast it to a particular symbol
     * type.
     * @param element DOM element representing symbol
     * @returns decoded symbol cast to specified type, if possible
     * @note not available in python bindings
     */
    //template <class SymbolType> static SymbolType* loadSymbol( const QDomElement& element, const QgsReadWriteContext &context );

    static QgsSymbolLayer* loadSymbolLayer( QDomElement& element, const QgsReadWriteContext &context ) /Factory/;
    static QDomElement saveSymbol( const QString& symbolName, QgsSymbol* symbol, QDomDocument& doc, const QgsReadWriteContext &context );

    /** Returns a string representing the symbol. Can be used to test for equality
     * between symbols.
     * @note added in QGIS 2.12
     */
    static QString symbolProperties( QgsSymbol *symbol );

    static bool createSymbolLayerListFromSld( QDomElement &element, QgsWkbTypes::GeometryType geomType, QgsSymbolLayerList &layers );

    static QgsSymbolLayer *createFillLayerFromSld( QDomElement &element );
    static QgsSymbolLayer *createLineLayerFromSld( QDomElement &element );
    static QgsSymbolLayer *createMarkerLayerFromSld( QDomElement &element );

    static bool convertPolygonSymbolizerToPointMarker( QDomElement &element, QgsSymbolLayerList &layerList );
    static bool hasExternalGraphic( QDomElement &element );
    static bool hasWellKnownMark( QDomElement &element );

    static bool needFontMarker( QDomElement &element );
    static bool needSvgMarker( QDomElement &element );
    static bool needEllipseMarker( QDomElement &element );
    static bool needMarkerLine( QDomElement &element );
    static bool needLinePatternFill( QDomElement &element );
    static bool needPointPatternFill( QDomElement &element );
    static bool needSvgFill( QDomElement &element );

    static void fillToSld( QDomDocument &doc, QDomElement &element,
                           Qt::BrushStyle brushStyle, const QColor &color = QColor() );
    static bool fillFromSld( QDomElement &element,
                             Qt::BrushStyle &brushStyle, QColor &color );

    //! @note not available in python bindings
/*
    static void lineToSld( QDomDocument &doc, QDomElement &element,
                           Qt::PenStyle penStyle, const QColor& color, double width = -1,
                           const Qt::PenJoinStyle *penJoinStyle = 0, const Qt::PenCapStyle *penCapStyle = 0,
                           const QVector<qreal> *customDashPattern = 0, double dashOffset = 0.0 );
*/
    static bool lineFromSld( QDomElement &element,
                             Qt::PenStyle &penStyle, QColor &color, double &width,
                             Qt::PenJoinStyle *penJoinStyle = 0, Qt::PenCapStyle *penCapStyle = 0,
                             QVector<qreal> *customDashPattern = 0, double *dashOffset = 0 );

    static void externalGraphicToSld( QDomDocument &doc, QDomElement &element,
                                      const QString& path, const QString& mime,
                                      const QColor &color, double size = -1 );
    static bool externalGraphicFromSld( QDomElement &element,
                                        QString &path, QString &mime,
                                        QColor &color, double &size );

    static void wellKnownMarkerToSld( QDomDocument &doc, QDomElement &element,
                                      const QString& name, const QColor& color, const QColor& strokeColor, Qt::PenStyle strokeStyle,
                                      double strokeWidth = -1, double size = -1 );

    //! @note available in python as wellKnownMarkerFromSld2
    static bool wellKnownMarkerFromSld( QDomElement &element,
                                        QString &name, QColor &color, QColor &strokeColor, Qt::PenStyle &strokeStyle,
                                        double &strokeWidth, double &size ) /PyName=wellKnownMarkerFromSld2/;

    static void externalMarkerToSld( QDomDocument &doc, QDomElement &element,
                                     const QString& path, const QString& format, int *markIndex = 0,
                                     const QColor &color = QColor(), double size = -1 );
    static bool externalMarkerFromSld( QDomElement &element,
                                       QString &path, QString &format, int &markIndex,
                                       QColor &color, double &size );


    static void labelTextToSld( QDomDocument &doc, QDomElement &element, const QString& label,
                                const QFont &font, const QColor &color = QColor(), double size = -1 );

    /** Create ogr feature style string for pen */
    static QString ogrFeatureStylePen( double width, double mmScaleFactor, double mapUnitsScaleFactor, const QColor& c,
                                       Qt::PenJoinStyle joinStyle = Qt::MiterJoin,
                                       Qt::PenCapStyle capStyle = Qt::FlatCap,
                                       double offset = 0.0,
                                       const QVector<qreal> *dashPattern = 0 );
    /** Create ogr feature style string for brush
     @param fillColr fill color*/
    static QString ogrFeatureStyleBrush( const QColor &fillColr );

    static void createRotationElement( QDomDocument &doc, QDomElement &element, const QString &rotationFunc );
    static bool rotationFromSldElement( QDomElement &element, QString &rotationFunc );

    static void createOpacityElement( QDomDocument &doc, QDomElement &element, const QString &alphaFunc );
    static bool opacityFromSldElement( QDomElement &element, QString &alphaFunc );

    static void createDisplacementElement( QDomDocument &doc, QDomElement &element, QPointF offset );
    static bool displacementFromSldElement( QDomElement &element, QPointF &offset );

    static void createOnlineResourceElement( QDomDocument &doc, QDomElement &element, const QString &path, const QString &format );
    static bool onlineResourceFromSldElement( QDomElement &element, QString &path, QString &format );

    static void createGeometryElement( QDomDocument &doc, QDomElement &element, const QString &geomFunc );
    static bool geometryFromSldElement( QDomElement &element, QString &geomFunc );

    static bool createExpressionElement( QDomDocument &doc, QDomElement &element, const QString &function );
    static bool createFunctionElement( QDomDocument &doc, QDomElement &element, const QString &function );
    static bool functionFromSldElement( QDomElement &element, QString &function );

    static QDomElement createSvgParameterElement( QDomDocument &doc, const QString &name, const QString &value );
    static QgsStringMap getSvgParameterList( QDomElement &element );

    static QDomElement createVendorOptionElement( QDomDocument &doc, const QString &name, const QString &value );
    static QgsStringMap getVendorOptionList( QDomElement &element );

    static QgsStringMap parseProperties( QDomElement &element );
    static void saveProperties( QgsStringMap props, QDomDocument &doc, QDomElement &element );

    static QgsSymbolMap loadSymbols( QDomElement& element, const QgsReadWriteContext &context ) /Factory/;
    static QDomElement saveSymbols( QgsSymbolMap& symbols, const QString& tagName, QDomDocument& doc, const QgsReadWriteContext &context );

    static void clearSymbolMap( QgsSymbolMap &symbols );

    static QgsColorRamp *loadColorRamp( QDomElement &element ) /Factory/;
    static QDomElement saveColorRamp( const QString &name, QgsColorRamp *ramp, QDomDocument &doc );
    static QVariant colorRampToVariant( const QString &name, QgsColorRamp *ramp );
    static QgsColorRamp *loadColorRamp( const QVariant &value );

    /**
     * Returns a friendly display name for a color
     * @param color source color
     * @returns display name for color
     * @note added in 2.5
     */
    static QString colorToName( const QColor &color );

    /**
     * Attempts to parse a string as a list of colors using a variety of common formats, including hex
     * codes, rgb and rgba strings.
     * @param colorStr string representing the color list
     * @returns list of parsed colors
     * @note added in 2.5
     */
    static QList< QColor > parseColorList( const QString &colorStr );

    /**
     * Creates mime data from a color. Sets both the mime data's color data, and the
     * mime data's text with the color's hex code.
     * @param color color to encode as mime data
     * @see colorFromMimeData
     * @note added in 2.5
     */
    static QMimeData *colorToMimeData( const QColor &color );

    /**
     * Attempts to parse mime data as a color
     * @param data mime data to parse
     * @param hasAlpha will be set to true if mime data was interpreted as a color containing
     * an explicit alpha value
     * @returns valid color if mimedata could be interpreted as a color, otherwise an
     * invalid color
     * @note added in 2.5
     */
    static QColor colorFromMimeData( const QMimeData *data, bool &hasAlpha );

    /**
     * Attempts to parse mime data as a list of named colors
     * @param data mime data to parse
     * @returns list of parsed colors
     * @note added in 2.5
     */
    static QgsNamedColorList colorListFromMimeData( const QMimeData *data );

    /**
     * Creates mime data from a list of named colors
     * @param colorList list of named colors
     * @param allFormats set to true to include additional mime formats, include text/plain and application/x-color
     * @returns mime data containing encoded colors
     * @note added in 2.5
     */
    static QMimeData *colorListToMimeData( const QgsNamedColorList &colorList, const bool allFormats = true );

    /**
     * Exports colors to a gpl GIMP palette file
     * @param file destination file
     * @param paletteName name of palette, which is stored in gpl file
     * @param colors colors to export
     * @returns true if export was successful
     * @see importColorsFromGpl
     */
    static bool saveColorsToGpl( QFile &file, const QString &paletteName, const QgsNamedColorList &colors );

    /**
     * Imports colors from a gpl GIMP palette file
     * @param file source gpl file
     * @param ok will be true if file was successfully read
     * @param name will be set to palette name from gpl file, if present
     * @returns list of imported colors
     * @see saveColorsToGpl
     */
    static QgsNamedColorList importColorsFromGpl( QFile &file, bool &ok, QString &name );

    /**
     * Attempts to parse a string as a color using a variety of common formats, including hex
     * codes, rgb and rgba strings.
     * @param colorStr string representing the color
     * @param strictEval set to true for stricter color parsing rules
     * @returns parsed color
     * @note added in 2.3
     */
    static QColor parseColor( const QString &colorStr, bool strictEval = false );

    /**
     * Attempts to parse a string as a color using a variety of common formats, including hex
     * codes, rgb and rgba strings.
     * @param colorStr string representing the color
     * @param containsAlpha if colorStr contains an explicit alpha value then containsAlpha will be set to true
     * @param strictEval set to true for stricter color parsing rules
     * @returns parsed color
     * @note added in 2.3
     */
    static QColor parseColorWithAlpha( const QString &colorStr, bool &containsAlpha, bool strictEval = false );

    /** Multiplies opacity of image pixel values with a (global) transparency value*/
    static void multiplyImageOpacity( QImage *image, qreal alpha );

    /** Blurs an image in place, e.g. creating Qt-independent drop shadows */
    static void blurImageInPlace( QImage &image, QRect rect, int radius, bool alphaOnly );

    /** Converts a QColor into a premultiplied ARGB QColor value using a specified alpha value
     * @note added in 2.3
     */
    static void premultiplyColor( QColor &rgb, int alpha );

    /** Sorts the passed list in requested order*/
    static void sortVariantList( QList<QVariant> &list, Qt::SortOrder order );
    /** Returns a point on the line from startPoint to directionPoint that is a certain distance away from the starting point*/
    static QPointF pointOnLineWithDistance( QPointF startPoint, QPointF directionPoint, double distance );

    //! Return a list of all available svg files
    static QStringList listSvgFiles();

    //! Return a list of svg files at the specified directory
    static QStringList listSvgFilesAt( const QString &directory );

    static QString svgSymbolNameToPath( QString name, const QgsPathResolver& pathResolver );

    static QString svgSymbolPathToName( QString path, const QgsPathResolver& pathResolver );

    //! Calculate the centroid point of a QPolygonF
    static QPointF polygonCentroid( const QPolygonF &points );

    //! Calculate a point within of a QPolygonF
    static QPointF polygonPointOnSurface( const QPolygonF &points );

    //! Calculate whether a point is within of a QPolygonF
    static bool pointInPolygon( const QPolygonF &points, QPointF point );

    /** Return a new valid expression instance for given field or expression string.
     * If the input is not a valid expression, it is assumed that it is a field name and gets properly quoted.
     * If the string is empty, returns null pointer.
     * This is useful when accepting input which could be either a non-quoted field name or expression.
     * @note added in 2.2
     */
    static QgsExpression *fieldOrExpressionToExpression( const QString &fieldOrExpression ) /Factory/;

    /** Return a field name if the whole expression is just a name of the field .
     *  Returns full expression string if the expression is more complex than just one field.
     *  Using just expression->expression() method may return quoted field name, but that is not
     *  wanted for saving (due to backward compatibility) or display in GUI.
     * @note added in 2.2
     */
    static QString fieldOrExpressionFromExpression( QgsExpression *expression );

    /** Computes a sequence of about 'classes' equally spaced round values
     *  which cover the range of values from 'minimum' to 'maximum'.
     *  The values are chosen so that they are 1, 2 or 5 times a power of 10.
     * @note added in 2.10
     */
    static QList<double> prettyBreaks( double minimum, double maximum, int classes );

    /** Rescales the given size based on the uomScale found in the props, if any is found, otherwise
     *  returns the value un-modified
     * @note added in 3.0
     */
    static double rescaleUom( double size, QgsUnitTypes::RenderUnit unit, const QgsStringMap &props );

    /** Rescales the given point based on the uomScale found in the props, if any is found, otherwise
     *  returns a copy of the original point
     * @note added in 3.0
     */
    static QPointF rescaleUom( QPointF point, QgsUnitTypes::RenderUnit unit, const QgsStringMap &props ) /PyName=rescalePointUom/;

    /** Rescales the given array based on the uomScale found in the props, if any is found, otherwise
     *  returns a copy of the original point
     * @note added in 3.0
     */
    static QVector<qreal> rescaleUom( const QVector<qreal> &array, QgsUnitTypes::RenderUnit unit, const QgsStringMap &props ) /PyName=rescaleArrayUom/;

    /**
     * Checks if the properties contain scaleMinDenom and scaleMaxDenom, if available, they are added into the SE Rule element
     * @note added in 3.0
     */
    static void applyScaleDependency( QDomDocument &doc, QDomElement &ruleElem, QgsStringMap &props );

    /**
      * Merges the local scale limits, if any, with the ones already in the map, if any
      * @note added in 3.0
      */
    static void mergeScaleDependencies( int mScaleMinDenom, int mScaleMaxDenom, QgsStringMap &props );

    /**
     * Encodes a reference to a parametric SVG into SLD, as a succession of parametric SVG using URL parameters,
     * a fallback SVG without parameters, and a final fallback as a mark with the right colors and stroke for systems
     * that cannot do SVG at all
     * @note added in 3.0
     */
    static void parametricSvgToSld( QDomDocument &doc, QDomElement &graphicElem,
                                    const QString& path,
                                    const QColor &fillColor, double size, const QColor &strokeColor, double strokeWidth );

    /**
     * Encodes a reference to a parametric SVG into a path with parameters according to the SVG Parameters spec
     * @note added in 3.0
     */
    static QString getSvgParametricPath( const QString &basePath, const QColor &fillColor, const QColor &strokeColor, double strokeWidth );

};
