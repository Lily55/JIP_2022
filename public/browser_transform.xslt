<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
  <xsl:template match="/objects">
    <!--Внутри шаблона пишем наше преобразование-->

    <html>

      <head>

        <title>Ответ</title>

      </head>

      <body>

        <table>

          <thead>

            <tr>

              <th>Десятичное число</th>
              <th>Двоичное представление</th>

            </tr>

          </thead>

          <!--Цикл-->
          <xsl:for-each select="object">

              <tr>
                <th>
                  <!--Извлекаем значение из XML-тега-->
                  <xsl:value-of select="elem"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="binary"></xsl:value-of>
                </th>

              </tr>

          </xsl:for-each>

        </table>

      </body>

    </html>

  </xsl:template>

</xsl:stylesheet>