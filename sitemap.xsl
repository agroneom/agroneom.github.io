<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
  exclude-result-prefixes="sitemap">

  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="bn">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="robots" content="noindex, nofollow"/>
        <title>Sitemap — Neom Agro</title>
        <style>
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #FDFAF2;
            color: #3A3A28;
            line-height: 1.7;
          }

          /* ── Header ── */
          .site-header {
            background: linear-gradient(135deg, #1B5E32, #2E7D4F);
            padding: 36px 40px;
            display: flex;
            align-items: center;
            gap: 20px;
          }
          .header-logo {
            width: 56px; height: 56px;
            background: linear-gradient(135deg, #D4920A, #F5C842);
            border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.8rem;
          }
          .header-text h1 {
            font-size: 1.7rem;
            font-weight: 800;
            color: #fff;
            letter-spacing: 0.5px;
          }
          .header-text p {
            color: rgba(255,255,255,0.65);
            font-size: 0.85rem;
            margin-top: 2px;
          }

          /* ── Stats bar ── */
          .stats-bar {
            background: #fff;
            border-bottom: 1px solid #E8E0C8;
            padding: 16px 40px;
            display: flex;
            gap: 40px;
            align-items: center;
            flex-wrap: wrap;
          }
          .stat-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.85rem;
            color: #6B6B50;
          }
          .stat-num {
            font-size: 1.1rem;
            font-weight: 700;
            color: #1B5E32;
          }

          /* ── Main table ── */
          .container { padding: 32px 40px 60px; max-width: 1000px; margin: 0 auto; }
          h2 {
            font-size: 1.05rem;
            font-weight: 700;
            color: #1C1C0E;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
          }
          h2::before {
            content: '';
            display: block;
            width: 4px; height: 20px;
            background: linear-gradient(180deg, #D4920A, #1B5E32);
            border-radius: 2px;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(28,28,14,0.08);
          }
          thead tr {
            background: linear-gradient(135deg, #1B5E32, #2E7D4F);
            color: white;
          }
          thead th {
            padding: 14px 18px;
            text-align: left;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
          }
          tbody tr {
            border-bottom: 1px solid #F0EAD8;
            transition: background 0.2s;
          }
          tbody tr:last-child { border-bottom: none; }
          tbody tr:hover { background: #F5F0E0; }
          tbody td {
            padding: 14px 18px;
            font-size: 0.88rem;
            vertical-align: middle;
          }
          .url-cell a {
            color: #1B5E32;
            font-weight: 600;
            text-decoration: none;
            word-break: break-all;
            display: flex;
            align-items: center;
            gap: 8px;
          }
          .url-cell a:hover { color: #D4920A; text-decoration: underline; }
          .url-cell a::before {
            content: '🔗';
            font-size: 0.9rem;
            flex-shrink: 0;
          }
          .url-cell a[href$="/"] ::before { content: '🏠'; }

          /* Priority badge */
          .priority {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 700;
          }
          .p-high   { background: #E8F5EE; color: #1B5E32; }
          .p-medium { background: #FFF3CC; color: #D4920A; }
          .p-low    { background: #FDECEA; color: #C0392B; }

          /* Changefreq badge */
          .freq {
            font-size: 0.78rem;
            color: #6B6B50;
            background: #F5F0E0;
            padding: 3px 10px;
            border-radius: 20px;
          }

          /* ── Footer ── */
          .site-footer {
            text-align: center;
            padding: 24px 40px;
            border-top: 1px solid #E8E0C8;
            font-size: 0.78rem;
            color: #6B6B50;
          }
          .site-footer a { color: #1B5E32; font-weight: 600; text-decoration: none; }
          .site-footer a:hover { text-decoration: underline; }

          @media (max-width: 640px) {
            .stats-bar, .site-header { padding: 16px 20px; }
            .container { padding: 20px 16px 40px; }
            thead th:nth-child(3), tbody td:nth-child(3) { display: none; }
          }
        </style>
      </head>
      <body>

        <!-- Header -->
        <header class="site-header">
          <div class="header-logo">🌿</div>
          <div class="header-text">
            <h1>Neom Agro — Sitemap</h1>
            <p>XML Sitemap · https://neomagro.github.io · বাংলাদেশ কৃষি ব্লগ</p>
          </div>
        </header>

        <!-- Stats bar -->
        <div class="stats-bar">
          <div class="stat-item">
            📄 মোট URL:
            <span class="stat-num">
              <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
            </span>
          </div>
          <div class="stat-item">
            🏆 সর্বোচ্চ Priority: <span class="stat-num">1.0</span>
          </div>
          <div class="stat-item">
            📅 Schema: <span class="stat-num">sitemaps.org/0.9</span>
          </div>
          <div class="stat-item">
            🌐 Language: <span class="stat-num">Bengali (bn-BD)</span>
          </div>
        </div>

        <!-- Table -->
        <div class="container">
          <h2>সমস্ত পেজ ও সেকশনের তালিকা</h2>
          <table>
            <thead>
              <tr>
                <th>#</th>
                <th>URL / Section</th>
                <th>Last Modified</th>
                <th>Change Freq</th>
                <th>Priority</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <xsl:variable name="priority" select="sitemap:priority"/>
                <tr>
                  <td style="color:#6B6B50; font-size:0.8rem; width:40px;">
                    <xsl:value-of select="position()"/>
                  </td>
                  <td class="url-cell">
                    <a href="{sitemap:loc}" target="_blank" rel="noopener">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td style="color:#6B6B50; white-space:nowrap; font-size:0.82rem;">
                    <xsl:value-of select="sitemap:lastmod"/>
                  </td>
                  <td>
                    <span class="freq">
                      <xsl:value-of select="sitemap:changefreq"/>
                    </span>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="$priority >= 0.9">
                        <span class="priority p-high"><xsl:value-of select="$priority"/></span>
                      </xsl:when>
                      <xsl:when test="$priority >= 0.7">
                        <span class="priority p-medium"><xsl:value-of select="$priority"/></span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="priority p-low"><xsl:value-of select="$priority"/></span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>

        <!-- Footer -->
        <footer class="site-footer">
          <p>
            Generated for <a href="https://neomagro.github.io/" target="_blank">Neom Agro</a> ·
            Validates against <a href="https://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" target="_blank">sitemaps.org schema 0.9</a> ·
            Submit at <a href="https://search.google.com/search-console" target="_blank">Google Search Console</a>
          </p>
        </footer>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
