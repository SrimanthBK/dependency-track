<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="librariesContainer">
    <c:if test="${!empty libList}">
        <table class="list tablesorter">
            <thead>
            <tr>
                <th><spring:message code="label.vendor"/></th>
                <th><spring:message code="label.name"/></th>
                <th><spring:message code="label.version"/></th>
                <th><spring:message code="label.license"/></th>
                <th><spring:message code="label.language"/></th>
                <th><spring:message code="label.secunia.id"/></th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${libList}" var="libList">
                <tr>
                    <td><c:out value="${libList.library.libraryVendor.vendor}"/></td>
                    <td><c:out value="${libList.library.libraryname}"/></td>
                    <td><c:out value="${libList.libraryversion}"/></td>
                    <td><a data-toggle="modal" class="open-LicenseLibrariesModal" data-licensefiletype ="${libList.library.license.contenttype}" data-licenseid ="${libList.library.license.id}" data-licensename ="${libList.library.license.licensename}" data-licensfileename ="${libList.library.license.filename}" href="#licenseLibrariesModal">${libList.library.license.licensename}</a></td>
                    <td><c:out value="${libList.library.language}"/></td>
                    <td><c:out value="${libList.secunia}"/></td>
                    <td style="vertical-align:top;text-align:right;">
                        <div class="btn-group">
                            <a data-toggle="modal"
                               data-libraryid ="${libList.library.id}"
                               data-vendorid ="${libList.library.libraryVendor.id}"
                               data-licenseid ="${libList.library.license.id}"
                               data-libraryversionid ="${libList.id}"
                               data-vendor ="${libList.library.libraryVendor.vendor}"
                               data-libraryname ="${libList.library.libraryname}"
                               data-libraryversion ="${libList.libraryversion}"
                               data-licensename ="${libList.library.license.licensename}"
                               data-language ="${libList.library.language}"
                               data-secunia ="${libList.secunia}"
                               class="open-EditLibrariesModal btn" href="#editLibrariesModal">Edit</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<div id="libraryModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="applicationModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="applicationModalLabel"><spring:message code="label.library.new"/></h4>
    </div>

        <c:url value="/addlibraries" var="addlibrariesUrl"/>
        <form:form id="addLibrariesForm" style="margin-bottom:0" action="${addlibrariesUrl}" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
            <table>
                <tr>
                    <td><label for="vendor"><spring:message code="label.vendor"/></label></td>
                    <td>
                        <div style="display:inline">
                            <select id="vendorid" name="libraryname" class="vendoridclass" >
                                <option value="">--</option>
                            </select>
                            <input id="vendor" name ="vendorsel" type="text" required="required" style="position:relative; height: 20px; border: 0; left: -223px; width: 183px;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="libraryname"><spring:message code="label.name"/></label></td>
                    <td>
                        <div style="display:inline">
                        <select id="librarynameid" name="libraryname" autofocus="autofocus" class="librarynameidclass" >
                            <option value="">--</option>
                        </select>
                        <input id="libraryname" name ="libnamesel" type="text" required="required" style="  position:relative; height: 20px; border: 0; left: -223px; width: 183px;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="libraryversion"><spring:message code="label.version"/></label></td>
                    <td>
                        <div style="display:inline">
                        <select id="libraryversionid" name="libraryname" class="libraryversionidclass">
                            <option value="">--</option>
                        </select>
                        <input id="libraryversion" name ="libversel" type="text"  required="required" style="  position:relative; height: 20px; border: 0; left: -223px; width: 183px;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="license"><spring:message code="label.license"/></label></td>
                    <td>
                        <div style="display:inline">
                        <select id="licenseids" name="license"  class="licenseidsclass">
                            <option value="">--</option>
                            <c:forEach items="${uniquelicList}" var="libList">
                                <option value="${libList.licensename}"><c:out value="${libList.licensename}"/></option>
                            </c:forEach>
                        </select>
                        <input id="license" name ="licensesel" type="text" required="required" style="  position:relative; height: 20px; border: 0; left: -223px; width: 183px;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="Licensefile"><spring:message code="label.license.file"/></label></td>
                    <td><input id="Licensefile" name="Licensefile" type="file" /></td>
                </tr>
                <tr>
                    <td><label for="language"><spring:message code="label.language"/></label></td>
                    <td>
                        <div style="display:inline">
                        <select id="languageid" name="language"  class="languageidclass">
                            <option value="">--</option>
                            <c:forEach items="${uniqueLang}" var="libList">
                                <option value="${libList}"><c:out value="${libList}"/></option>
                            </c:forEach>
                        </select>
                        <input id="language" name ="languagesel"  type="text" required="required" style="  position:relative; height: 20px; border: 0; left: -223px; width: 183px;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="secuniaID"><spring:message code="label.secunia.id"/></label></td>
                    <td><input id="secuniaID" name="secuniaID" type="text" /></td>
                </tr>
            </table>
        </div>

        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="label.close"/></button>
            <button class="modalSubmit btn btn-primary"><spring:message code="label.library.add"/></button>
        </div>
        </form:form>
    </div>

   <%--editting libraries without being associated to applications--%>

<div id="editLibrariesModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editLibrariesModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="editLibrariesModalLabel"><spring:message code="label.library.edit"/>
            <span class="delete-span">
                <spring:message code="confirm.delete.library" var="confirmDeleteLibrary"/>
				<a class="btn btn-danger header-button" id="deleteLibrary" href="" onclick="return confirm('${confirmDeleteLibrary}')"><spring:message code="label.delete"/></a>
			</span>
        </h4>
    </div>

    <c:url value="/updatelibrary" var="updatelibraryUrl"/>
    <form:form id="editLibrariesForm" style="margin-bottom:0" action="${updatelibraryUrl}" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
                <table>
                    <tr>
                        <td><label for="librarynameedit"><spring:message code="label.name"/></label></td>
                        <td><input id="librarynameedit" name="libraryname" type="text" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for="libraryversionedit"><spring:message code="label.version"/></label></td>
                        <td><input id="libraryversionedit" name="libraryversion" type="text" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for="vendoredit"><spring:message code="label.vendor"/></label></td>
                        <td><input id="vendoredit" name="vendor" type="text" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for="licenseedit"><spring:message code="label.license"/></label></td>
                        <td><input id="licenseedit" name="license" type="text" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for="Licensefileedit"><spring:message code="label.license.file"/></label></td>
                        <td><input id="Licensefileedit" name="Licensefile" type="file" /></td>
                    </tr>
                    <tr>
                        <td><label for="languageedit"><spring:message code="label.language"/></label></td>
                        <td><input id="languageedit" name="language" type="text" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for="secuniaIDedit"><spring:message code="label.secunia.id"/></label></td>
                        <td><input id="secuniaIDedit" name="secuniaID" type="text" value=""/></td>
                    </tr>
                </table>
                <input type="hidden" id="editvendorid" name="editvendorid" value=""/>
                <input type="hidden" id="editlicenseid" name="editlicenseid" value=""/>
                <input type="hidden" id="editlibraryid" name="editlibraryid" value=""/>
                <input type="hidden" id="editlibraryversionid" name="editlibraryversionid" value=""/>
            </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="label.close"/></button>
            <button class="modalSubmit btn btn-primary"><spring:message code="label.saveChanges"/></button>
        </div>
    </form:form>
</div>

<div id="licenseLibrariesModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="licenseLibrariesModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h4 id="licenseLibrariesModalLabel"><spring:message code="label.license.view"/></h4>
    </div>

    <c:url value="/downloadlicense" var="downloadlicenseUrl"/>
    <form:form id="licenseLibrariesForm" style="margin-bottom:0" action="${downloadlicenseUrl}" method="post" autocomplete="off" enctype="multipart/form-data">
        <div class="modal-body">
            <table>
                <tr>
                    <td><label for="licensename"><spring:message code="label.name"/></label></td>
                    <td><input id="licensename" name="licensename" type="text" value="" readonly/></td>
                </tr>
                <tr>
                    <td><label for="licensfileename"><spring:message code="label.license.file"/></label></td>
                    <td><input id="licensfileename" name="licensfileename" type="text" value="" readonly/></td>
                </tr>
                <tr>
                    <td><label for="viewlicense"><spring:message code="label.license"/></label></td>
                    <td>
                        <iframe id="viewlicense" width="400" height="400" src="" seamless="seamless" sandbox="allow-same-origin"></iframe>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="licenseid" name="licenseid" value=""/>
        </div>



        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="label.close"/></button>
            <button class="modalSubmit btn btn-primary"><spring:message code="label.download"/></button>
        </div>
    </form:form>
</div>
