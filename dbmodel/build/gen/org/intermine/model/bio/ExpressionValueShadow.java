package org.intermine.model.bio;

import org.intermine.objectstore.ObjectStore;
import org.intermine.objectstore.intermine.NotXmlParser;
import org.intermine.objectstore.intermine.NotXmlRenderer;
import org.intermine.objectstore.proxy.ProxyReference;
import org.intermine.model.StringConstructor;
import org.intermine.metadata.TypeUtil;
import org.intermine.util.DynamicUtil;
import org.intermine.model.ShadowClass;

public class ExpressionValueShadow implements ExpressionValue, ShadowClass
{
    public static final Class<ExpressionValue> shadowOf = ExpressionValue.class;
    // Attr: org.intermine.model.bio.ExpressionValue.value
    protected java.lang.Double value;
    public java.lang.Double getValue() { return value; }
    public void setValue(final java.lang.Double value) { this.value = value; }

    // Ref: org.intermine.model.bio.ExpressionValue.sample
    protected org.intermine.model.InterMineObject sample;
    public org.intermine.model.bio.ExpressionSample getSample() { if (sample instanceof org.intermine.objectstore.proxy.ProxyReference) { return ((org.intermine.model.bio.ExpressionSample) ((org.intermine.objectstore.proxy.ProxyReference) sample).getObject()); }; return (org.intermine.model.bio.ExpressionSample) sample; }
    public void setSample(final org.intermine.model.bio.ExpressionSample sample) { this.sample = sample; }
    public void proxySample(final org.intermine.objectstore.proxy.ProxyReference sample) { this.sample = sample; }
    public org.intermine.model.InterMineObject proxGetSample() { return sample; }

    // Ref: org.intermine.model.bio.ExpressionValue.gene
    protected org.intermine.model.InterMineObject gene;
    public org.intermine.model.bio.Gene getGene() { if (gene instanceof org.intermine.objectstore.proxy.ProxyReference) { return ((org.intermine.model.bio.Gene) ((org.intermine.objectstore.proxy.ProxyReference) gene).getObject()); }; return (org.intermine.model.bio.Gene) gene; }
    public void setGene(final org.intermine.model.bio.Gene gene) { this.gene = gene; }
    public void proxyGene(final org.intermine.objectstore.proxy.ProxyReference gene) { this.gene = gene; }
    public org.intermine.model.InterMineObject proxGetGene() { return gene; }

    // Attr: org.intermine.model.InterMineObject.id
    protected java.lang.Integer id;
    public java.lang.Integer getId() { return id; }
    public void setId(final java.lang.Integer id) { this.id = id; }

    @Override public boolean equals(Object o) { return (o instanceof ExpressionValue && id != null) ? id.equals(((ExpressionValue)o).getId()) : this == o; }
    @Override public int hashCode() { return (id != null) ? id.hashCode() : super.hashCode(); }
    @Override public String toString() { return "ExpressionValue [gene=" + (gene == null ? "null" : (gene.getId() == null ? "no id" : gene.getId().toString())) + ", id=" + id + ", sample=" + (sample == null ? "null" : (sample.getId() == null ? "no id" : sample.getId().toString())) + ", value=" + value + "]"; }
    public Object getFieldValue(final String fieldName) throws IllegalAccessException {
        if ("value".equals(fieldName)) {
            return value;
        }
        if ("sample".equals(fieldName)) {
            if (sample instanceof ProxyReference) {
                return ((ProxyReference) sample).getObject();
            } else {
                return sample;
            }
        }
        if ("gene".equals(fieldName)) {
            if (gene instanceof ProxyReference) {
                return ((ProxyReference) gene).getObject();
            } else {
                return gene;
            }
        }
        if ("id".equals(fieldName)) {
            return id;
        }
        if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
            return TypeUtil.getFieldValue(this, fieldName);
        }
        throw new IllegalArgumentException("Unknown field " + fieldName);
    }
    public Object getFieldProxy(final String fieldName) throws IllegalAccessException {
        if ("value".equals(fieldName)) {
            return value;
        }
        if ("sample".equals(fieldName)) {
            return sample;
        }
        if ("gene".equals(fieldName)) {
            return gene;
        }
        if ("id".equals(fieldName)) {
            return id;
        }
        if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
            return TypeUtil.getFieldProxy(this, fieldName);
        }
        throw new IllegalArgumentException("Unknown field " + fieldName);
    }
    public void setFieldValue(final String fieldName, final Object value) {
        if ("value".equals(fieldName)) {
            this.value = (java.lang.Double) value;
        } else if ("sample".equals(fieldName)) {
            sample = (org.intermine.model.InterMineObject) value;
        } else if ("gene".equals(fieldName)) {
            gene = (org.intermine.model.InterMineObject) value;
        } else if ("id".equals(fieldName)) {
            id = (java.lang.Integer) value;
        } else {
            if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
                DynamicUtil.setFieldValue(this, fieldName, value);
                return;
            }
            throw new IllegalArgumentException("Unknown field " + fieldName);
        }
    }
    public Class<?> getFieldType(final String fieldName) {
        if ("value".equals(fieldName)) {
            return java.lang.Double.class;
        }
        if ("sample".equals(fieldName)) {
            return org.intermine.model.bio.ExpressionSample.class;
        }
        if ("gene".equals(fieldName)) {
            return org.intermine.model.bio.Gene.class;
        }
        if ("id".equals(fieldName)) {
            return java.lang.Integer.class;
        }
        if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
            return TypeUtil.getFieldType(org.intermine.model.bio.ExpressionValue.class, fieldName);
        }
        throw new IllegalArgumentException("Unknown field " + fieldName);
    }
    public StringConstructor getoBJECT() {
        if (!org.intermine.model.bio.ExpressionValueShadow.class.equals(getClass())) {
            return NotXmlRenderer.render(this);
        }
        StringConstructor sb = new StringConstructor();
        sb.append("$_^org.intermine.model.bio.ExpressionValue");
        if (value != null) {
            sb.append("$_^avalue$_^").append(value);
        }
        if (sample != null) {
            sb.append("$_^rsample$_^").append(sample.getId());
        }
        if (gene != null) {
            sb.append("$_^rgene$_^").append(gene.getId());
        }
        if (id != null) {
            sb.append("$_^aid$_^").append(id);
        }
        return sb;
    }
    public void setoBJECT(String notXml, ObjectStore os) {
        setoBJECT(NotXmlParser.SPLITTER.split(notXml), os);
    }
    public void setoBJECT(final String[] notXml, final ObjectStore os) {
        if (!org.intermine.model.bio.ExpressionValueShadow.class.equals(getClass())) {
            throw new IllegalStateException("Class " + getClass().getName() + " does not match code (org.intermine.model.bio.ExpressionValue)");
        }
        for (int i = 2; i < notXml.length;) {
            int startI = i;
            if ((i < notXml.length) && "avalue".equals(notXml[i])) {
                i++;
                value = Double.valueOf(notXml[i]);
                i++;
            }
            if ((i < notXml.length) &&"rsample".equals(notXml[i])) {
                i++;
                sample = new ProxyReference(os, Integer.valueOf(notXml[i]), org.intermine.model.bio.ExpressionSample.class);
                i++;
            };
            if ((i < notXml.length) &&"rgene".equals(notXml[i])) {
                i++;
                gene = new ProxyReference(os, Integer.valueOf(notXml[i]), org.intermine.model.bio.Gene.class);
                i++;
            };
            if ((i < notXml.length) && "aid".equals(notXml[i])) {
                i++;
                id = Integer.valueOf(notXml[i]);
                i++;
            }
            if (startI == i) {
                throw new IllegalArgumentException("Unknown field " + notXml[i]);
            }
        }
    }
    public void addCollectionElement(final String fieldName, final org.intermine.model.InterMineObject element) {
        {
            if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
                TypeUtil.addCollectionElement(this, fieldName, element);
                return;
            }
            throw new IllegalArgumentException("Unknown collection " + fieldName);
        }
    }
    public Class<?> getElementType(final String fieldName) {
        if (!org.intermine.model.bio.ExpressionValue.class.equals(getClass())) {
            return TypeUtil.getElementType(org.intermine.model.bio.ExpressionValue.class, fieldName);
        }
        throw new IllegalArgumentException("Unknown field " + fieldName);
    }
}