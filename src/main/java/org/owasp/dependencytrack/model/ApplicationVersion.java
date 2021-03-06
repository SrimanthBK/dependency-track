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
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "APPLICATIONVERSION")
public final class ApplicationVersion implements Cloneable {

    /**
     * The unique identifier of the persisted object.
     */
    @Id
    @Column(name = "ID")
    @GeneratedValue
    private Integer id;

    /**
     * The version string (i.e. 1.0) of the application.
     */
    @Column(name = "VERSION", nullable = false)
    private String version;

    /**
     * The parent application.
     */
    @ManyToOne
    @JoinColumn(name = "APPID", nullable = false)
    private Application application;

    /**
     * Clones this specific object (minus the objects id).
     * @return a New object
     */
    public Object clone() {
        final ApplicationVersion obj = new ApplicationVersion();
        obj.setApplication(this.application);
        obj.setVersion(this.version);
        return obj;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Application getApplication() {
        return application;
    }

    public void setApplication(Application application) {
        this.application = application;
    }


}
