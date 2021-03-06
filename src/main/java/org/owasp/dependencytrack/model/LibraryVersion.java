/*
 * This file is part of Dependency-Track.
 *
 * Dependency-Track is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Dependency-Track is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Dependency-Track. If not, see http://www.gnu.org/licenses/.
 *
 * Copyright (c) Axway. All Rights Reserved.
 */

package org.owasp.dependencytrack.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "LIBRARYVERSION")
public final class LibraryVersion implements Cloneable {

    /**
     * The unique identifier of the persisted object.
     */
    @Id
    @Column(name = "ID")
    @GeneratedValue
    private Integer id;

    /**
     * The String representation of the version of the library (i.e. 1.3.0).
     */
    @Column(name = "LIBRARYVERSION")
    @OrderBy
    private String libraryversion;

    /**
     * The parent Library object for this version.
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "LIBRARYID", nullable = false)
    private Library library;

    /**
     * The Secunia ID (if available) of this library version.
     */
    @Column(name = "SECUNIA", nullable = true)
    private Integer secunia;

    /**
     * Clones this specific object (minus the objects id).
     * @return a New object
     */
    public Object clone() {
        final LibraryVersion obj = new LibraryVersion();
        obj.setLibrary(this.library);
        obj.setLibraryversion(this.libraryversion);
        obj.setSecunia(this.secunia);
        return obj;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibraryversion() {
        return libraryversion;
    }

    public void setLibraryversion(String libraryversion) {
        this.libraryversion = libraryversion;
    }

    public Library getLibrary() {
        return library;
    }

    public void setLibrary(Library library) {
        this.library = library;
    }

    public Integer getSecunia() {
        return secunia;
    }

    public void setSecunia(Integer secunia) {
        this.secunia = secunia;
    }

}
