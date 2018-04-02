#include "mainpage.h"

MainPage::MainPage(QObject *qml, QObject *parent) :
    QObject(parent)
{
    // connect QML signals to MainPage slots
    connect(qml, SIGNAL(openTabMainRequested()), this, SLOT(openTabMainRequested()));

    // connect MainPage signals to QML signals
    connect(this, SIGNAL(openTabMain(QVariant)), qml, SIGNAL(openTabMain(QVariant)));
    connect(this, SIGNAL(setPageContent(int,QString)), qml, SIGNAL(setPageContent(int,QString)));

}

void MainPage::openTabMainRequested()
{
    enum TabName {ABOUT,CREDITS,TRANSLATION,LICENSE};
    QStringList tabNames;

    tabNames << "About" << "Credits" << "Translation" << "License";

    QString aboutContent;
    aboutContent += "<b>TestApp15</b> is a simple example application that ";
    aboutContent += "creates a tabbed page selector. The tab names and ";
    aboutContent += "page contents are set from the C++ code.<p>";
    aboutContent += "The text size is controlled by the screen orientation.<p>";
    aboutContent += "Source code is available at https://github.com/n9dyfi/TestApp15.git";

    QString creditsContent;
    creditsContent +="<b>Thanks To</b><br>";
    creditsContent +="<div style='margin-left:15px;'>";
    creditsContent +="<u>John Doe</u><br>Main Application development<br>john.doe@example.com<br>";
    creditsContent +="<br>";
    creditsContent +="<u>Jane Doe</u><br>Main Application Icon<br>jane.doe@example.com<br></div>";


    QString translationContent;
    translationContent += "Currently there are no translations available.";

    QString licenseContent;

    licenseContent += "This package is free software; you can redistribute it and/or modify ";
    licenseContent += "it under the terms of the GNU General Public License as published by ";
    licenseContent += "the Free Software Foundation; either version 2 of the License, or ";
    licenseContent += "(at your option) any later version.";

    licenseContent += "<p>This package is distributed in the hope that it will be useful, ";
    licenseContent += "but WITHOUT ANY WARRANTY; without even the implied warranty of ";
    licenseContent += "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the ";
    licenseContent += "GNU General Public License for more details.";

    licenseContent += "<p>You should have received a copy of the GNU General Public License ";
    licenseContent += "along with this package; if not, write to the Free Software ";
    licenseContent += "Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA";

    licenseContent += "<p>On Debian systems, the complete text of the GNU General ";
    licenseContent += "Public License can be found in `/usr/share/common-licenses/GPL'.";

    licenseContent += "<p>The Debian packaging is (C) 2018, N9dyfi &lt;n9dyfi@gmail.com&gt; and ";
    licenseContent += "is licensed under the GPL, see above.";

    // Open the TabMain page
    emit(openTabMain(QVariant::fromValue(tabNames)));

    // Set content for each TabPage
    emit(setPageContent(ABOUT,aboutContent));
    emit(setPageContent(CREDITS,creditsContent));
    emit(setPageContent(TRANSLATION,translationContent));
    emit(setPageContent(LICENSE,licenseContent));
}

