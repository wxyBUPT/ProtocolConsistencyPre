#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QTextStream>
#include <QFile>
class FileIO : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)
    Q_PROPERTY(QString filename
               READ source
               WRITE setSource
               NOTIFY sourceChanged)

    explicit FileIO(QObject *parent = 0);

    Q_INVOKABLE QString read();
    Q_INVOKABLE bool write(const QString& data);
    Q_INVOKABLE QString open(const QString& filename);

    QString source() { return mSource; }

public slots:
    void setSource(const QString& source) { mSource = source; }

signals:
    void sourceChanged(const QString& source);
    void error(const QString& msg);

private:
    QString mSource;
    QString filename;
};

#endif // FILEIO_H
