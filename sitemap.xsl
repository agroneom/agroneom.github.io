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
        <title>Sitemap — Neom Agro | sonali.pro.bd</title>
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

          body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #FDFAF2;
            color: #3A3A28;
            line-height: 1.7;
            min-height: 100vh;
          }

          /* ── Header ── */
          .site-header {
            background: linear-gradient(135deg, #1B5E32 0%, #2E7D4F 60%, #D4920A 100%);
            padding: 32px 48px;
            display: flex;
            align-items: center;
            gap: 20px;
          }
          .header-logo {
            width: 58px; height: 58px;
            background: rgba(255,255,255,0.15);
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.9rem;
            backdrop-filter: blur(4px);
          }
          .header-text h1 {
            font-size: 1.55rem;
            font-weight: 800;
            color: #fff;
            letter-spacing: 0.3px;
          }
          .header-text p {
            color: rgba(255,255,255,0.7);
            font-size: 0.82rem;
            margin-top: 3px;
          }
          .header-badge {
            margin-left: auto;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 30px;
            padding: 6px 16px;
            color: white;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
          }

          /* ── Stats bar ── */
          .stats-bar {
            background: white;
            border-bottom: 2px solid #E8E0C8;
            padding: 14px 48px;
            display: flex;
            gap: 36px;
            align-items: center;
            flex-wrap: wrap;
          }
          .stat-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.82rem;
            color: #6B6B50;
          }
          .stat-num {
            font-size: 1rem;
            font-weight: 800;
            color: #1B5E32;
          }
          .stat-divider {
            width: 1px; height: 24px;
            background: #E8E0C8;
          }

          /* ── Container ── */
          .container {
            padding: 36px 48px 70px;
            max-width: 1060px;
            margin: 0 auto;
          }

          .table-title {
            font-size: 1rem;
            font-weight: 700;
            color: #1C1C0E;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
          }
          .table-title::before {
            content: '';
            display: block;
            width: 4px; height: 22px;
            background: linear-gradient(180deg, #D4920A, #1B5E32);
            border-radius: 2px;
            flex-shrink: 0;
          }

          /* ── Table ── */
          table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 28px rgba(28,28,14,0.09);
            border: 1px solid #E8E0C8;
          }
          thead tr {
            background: linear-gradient(135deg, #1B5E32, #2E7D4F);
          }
          thead th {
            padding: 15px 20px;
            text-align: left;
            font-size: 0.7rem;
            font-weight: 800;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.9);
            white-space: nowrap;
          }
          tbody tr {
            border-bottom: 1px solid #F0EAD8;
            transition: background 0.18s;
          }
          tbody tr:last-child { border-bottom: none; }
          tbody tr:nth-child(even) { background: #FDFAF5; }
          tbody tr:hover { background: #FFF8E8; }
          tbody td {
            padding: 15px 20px;
            font-size: 0.86rem;
            vertical-align: middle;
          }

          /* Row number */
          .td-num {
            color: #aaa;
            font-size: 0.75rem;
            font-weight: 700;
            width: 36px;
            text-align: center;
          }

          /* URL cell */
          .url-cell a {
            color: #1B5E32;
            font-weight: 600;
            text-decoration: none;
            word-break: break-all;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: color 0.2s;
          }
          .url-cell a:hover { color: #D4920A; }
          .url-icon {
            width: 30px; height: 30px;
            border-radius: 8px;
            display: flex; align-items: center; justify-content: center;
            font-size: 0.9rem;
            flex-shrink: 0;
          }
          .icon-home { background: #E8F5EE; }
          .icon-section { background: #FFF3CC; }
          .icon-faq { background: #FDECEA; }
          .icon-blog { background: #E8EAF6; }

          /* Section label */
          .section-label {
            font-size: 0.68rem;
            color: #6B6B50;
            margin-top: 2px;
            font-weight: 400;
          }

          /* Date */
          .td-date {
            color: #6B6B50;
            white-space: nowrap;
            font-size: 0.8rem;
            font-variant-numeric: tabular-nums;
          }

          /* Freq badge */
          .freq {
            font-size: 0.72rem;
            color: #6B6B50;
            background: #F5F0E0;
            border: 1px solid #E8E0C8;
            padding: 3px 11px;
            border-radius: 20px;
            white-space: nowrap;
          }
          .freq-weekly { background: #E8F5EE; color: #1B5E32; border-color: rgba(27,94,50,0.2); }

          /* Priority badge */
          .priority {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 800;
            white-space: nowrap;
          }
          .p-100 { background: #E8F5EE; color: #1B5E32; border: 1px solid rgba(27,94,50,0.2); }
          .p-95  { background: #D4EDDA; color: #155724; border: 1px solid rgba(21,87,36,0.2); }
          .p-90  { background: #FFF3CC; color: #856404; border: 1px solid rgba(133,100,4,0.2); }
          .p-85  { background: #FFF8E1; color: #A0760A; border: 1px solid rgba(160,118,10,0.2); }
          .p-80  { background: #FFF3E0; color: #C0622B; border: 1px solid rgba(192,98,43,0.2); }

          /* Priority bar visual */
          .p-bar {
            display: flex; align-items: center; gap: 8px;
          }
          .p-track {
            width: 60px; height: 5px;
            background: #EEE; border-radius: 3px; overflow: hidden;
          }
          .p-fill { height: 100%; border-radius: 3px; }

          /* ── Info box ── */
          .info-box {
            margin-top: 28px;
            background: white;
            border: 1px solid #E8E0C8;
            border-left: 4px solid #1B5E32;
            border-radius: 12px;
            padding: 20px 24px;
            display: flex;
            align-items: flex-start;
            gap: 14px;
          }
          .info-icon { font-size: 1.4rem; flex-shrink: 0; margin-top: 1px; }
          .info-text { font-size: 0.85rem; color: #3A3A28; line-height: 1.7; }
          .info-text strong { color: #1B5E32; }
          .info-text a { color: #1B5E32; font-weight: 600; }
          .info-text a:hover { color: #D4920A; }
          .info-steps {
            margin-top: 10px;
            display: flex; flex-wrap: wrap; gap: 8px;
          }
          .info-step {
            background: #F5F0E0; border-radius: 8px;
            padding: 6px 14px; font-size: 0.78rem;
            color: #3A3A28; display: flex; align-items: center; gap: 6px;
          }

          /* ── Footer ── */
          .site-footer {
            text-align: center;
            padding: 22px 48px;
            border-top: 1px solid #E8E0C8;
            font-size: 0.78rem;
            color: #6B6B50;
            background: white;
          }
          .site-footer a { color: #1B5E32; font-weight: 600; text-decoration: none; }
          .site-footer a:hover { color: #D4920A; text-decoration: underline; }

          @media (max-width: 700px) {
            .site-header, .stats-bar, .container, .site-footer { padding-left: 20px; padding-right: 20px; }
            .header-badge { display: none; }
            thead th:nth-child(3), tbody td:nth-child(3) { display: none; }
            thead th:nth-child(4), tbody td:nth-child(4) { display: none; }
          }
        </style>
      </head>
      <body>

        <!-- ── Header ── -->
        <header class="site-header">
          <div class="header-logo">🌿</div>
          <div class="header-text">
            <h1>Neom Agro — XML Sitemap</h1>
            <p>সোনালী মুরগী পালন · sonali.pro.bd · বাংলাদেশ</p>
          </div>
          <span class="header-badge">SEO Sitemap</span>
        </header>

        <!-- ── Stats bar ── -->
        <div class="stats-bar">
          <div class="stat-item">
            📄 মোট URL
            <span class="stat-num">
              <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
            </span>
          </div>
          <div class="stat-divider"/>
          <div class="stat-item">
            🏆 Highest Priority <span class="stat-num">1.0</span>
          </div>
          <div class="stat-divider"/>
          <div class="stat-item">
            🌐 Domain <span class="stat-num">sonali.pro.bd</span>
          </div>
          <div class="stat-divider"/>
          <div class="stat-item">
            📅 Updated <span class="stat-num">2026-05-24</span>
          </div>
          <div class="stat-divider"/>
          <div class="stat-item">
            ✅ Schema <span class="stat-num">sitemaps.org/0.9</span>
          </div>
        </div>

        <!-- ── Table ── -->
        <div class="container">
          <div class="table-title">সমস্ত পেজ ও সেকশনের সম্পূর্ণ তালিকা</div>

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
                <xsl:variable name="p" select="number(sitemap:priority)"/>
                <xsl:variable name="loc" select="sitemap:loc"/>
                <xsl:variable name="freq" select="sitemap:changefreq"/>

                <tr>
                  <!-- # -->
                  <td class="td-num"><xsl:value-of select="position()"/></td>

                  <!-- URL -->
                  <td class="url-cell">
                    <a href="{$loc}" target="_blank" rel="noopener">
                      <xsl:choose>
                        <xsl:when test="$loc = 'https://sonali.pro.bd/'">
                          <span class="url-icon icon-home">🏠</span>
                        </xsl:when>
                        <xsl:when test="contains($loc, 'faq')">
                          <span class="url-icon icon-faq">❓</span>
                        </xsl:when>
                        <xsl:when test="contains($loc, 'blogs')">
                          <span class="url-icon icon-blog">📝</span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="url-icon icon-section">📌</span>
                        </xsl:otherwise>
                      </xsl:choose>
                      <div>
                        <div><xsl:value-of select="$loc"/></div>
                        <div class="section-label">
                          <xsl:choose>
                            <xsl:when test="$loc = 'https://sonali.pro.bd/'">হোমপেজ — মূল পাতা</xsl:when>
                            <xsl:when test="contains($loc, '#about')">সোনালী মুরগী পরিচিতি</xsl:when>
                            <xsl:when test="contains($loc, '#facts')">১০টি গুরুত্বপূর্ণ তথ্য</xsl:when>
                            <xsl:when test="contains($loc, '#guide')">১–৯০ দিনের পালন গাইড</xsl:when>
                            <xsl:when test="contains($loc, '#nutrition')">খাদ্য ব্যবস্থাপনা</xsl:when>
                            <xsl:when test="contains($loc, '#disease')">রোগবালাই ও প্রতিরোধ</xsl:when>
                            <xsl:when test="contains($loc, '#economics')">লাভ-লোকসান হিসাব</xsl:when>
                            <xsl:when test="contains($loc, '#resources')">রিসোর্স ও বাহ্যিক লিঙ্ক</xsl:when>
                            <xsl:when test="contains($loc, '#faq')">পোল্ট্রি ফার্ম FAQ (১২টি)</xsl:when>
                            <xsl:when test="contains($loc, '#murgi-faq')">মুরগী FAQ (১৮টি)</xsl:when>
                            <xsl:when test="contains($loc, '#blogs')">সম্পর্কিত ব্লগ পোস্ট</xsl:when>
                          </xsl:choose>
                        </div>
                      </div>
                    </a>
                  </td>

                  <!-- Last Modified -->
                  <td class="td-date">
                    <xsl:value-of select="sitemap:lastmod"/>
                  </td>

                  <!-- Change Freq -->
                  <td>
                    <xsl:choose>
                      <xsl:when test="$freq = 'weekly'">
                        <span class="freq freq-weekly">⚡ weekly</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="freq">🔄 <xsl:value-of select="$freq"/></span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>

                  <!-- Priority -->
                  <td>
                    <div class="p-bar">
                      <xsl:choose>
                        <xsl:when test="$p = 1.0">
                          <span class="priority p-100">⭐ 1.0</span>
                        </xsl:when>
                        <xsl:when test="$p = 0.95">
                          <span class="priority p-95">🔥 0.95</span>
                        </xsl:when>
                        <xsl:when test="$p = 0.9">
                          <span class="priority p-90">✅ 0.90</span>
                        </xsl:when>
                        <xsl:when test="$p = 0.85">
                          <span class="priority p-85">📌 0.85</span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="priority p-80">📎 <xsl:value-of select="$p"/></span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </div>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <!-- Info box -->
          <div class="info-box">
            <div class="info-icon">🚀</div>
            <div class="info-text">
              <strong>Google Search Console-এ Submit করুন</strong> — এই sitemap টি index করাতে নিচের ধাপগুলো অনুসরণ করুন:
              <div class="info-steps">
                <span class="info-step">① <a href="https://search.google.com/search-console" target="_blank">GSC খুলুন</a></span>
                <span class="info-step">② sonali.pro.bd property select করুন</span>
                <span class="info-step">③ Indexing → Sitemaps</span>
                <span class="info-step">④ sitemap.xml টাইপ করে Submit করুন</span>
                <span class="info-step">⑤ ৩–৭ দিন অপেক্ষা করুন</span>
              </div>
            </div>
          </div>
        </div>

        <!-- ── Footer ── -->
        <footer class="site-footer">
          <p>
            <a href="https://sonali.pro.bd/" target="_blank">Neom Agro — sonali.pro.bd</a>
            &amp;#160;·&amp;#160;
            Validates against <a href="https://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" target="_blank">sitemaps.org schema 0.9</a>
            &amp;#160;·&amp;#160;
            <a href="https://search.google.com/search-console" target="_blank">Google Search Console</a>
            &amp;#160;·&amp;#160;
            <a href="https://www.bing.com/webmasters" target="_blank">Bing Webmaster</a>
          </p>
        </footer>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
